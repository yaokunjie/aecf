#include "boost/lockfree/spsc_queue.hpp"
#include <iostream>
#include <thread>
#include <fstream>
#include <string>
#include "AHRS.h"
#include "mpu6050.h"
#include "hmc5883l.h"
#include "motorcontrol.h"
#include "Arduino.h"
#include "Wire.h"
#include "Quaternion.h"

//---------------------------------
int parameter[6] = {0};
//--------------------------------
MPU6050 mpu;
HMC5883L hmc;
MotorControl mc;
AHRS ahrs(1/256, 1.0f, 1.0f);
//--------------sq------------------------------
boost::lockfree::spsc_queue<SensorRaw> gyr_sq(1000);
boost::lockfree::spsc_queue<SensorRaw> acc_sq(1000);
boost::lockfree::spsc_queue<SensorRaw> mag_sq(1000);
boost::lockfree::spsc_queue<float> deltat_sq(1000);
//--------------------------------------------------

using namespace std;

void data_producer()
{
    cout << "data_producer_thread excution\n";
    //--------------------------------------------------
    const unsigned long sample_count = parameter[3];
    const float frequency = parameter[4];
    const float sample_period = 1.0f/frequency * 1000.0f;
    float deltaT = sample_period;
    auto start = chrono::steady_clock::now();
    auto now = chrono::steady_clock::now();
    //ofstream fout("./data/time_data.dat", ios_base::out | ios_base::trunc | ios_base::binary);
    unsigned long count = 0;
    SensorRaw accRaw, gyrRaw, magRaw;
    gyr_sq.push(gyrRaw);
    acc_sq.push(accRaw);
    mag_sq.push(magRaw);
    while(1)
    {
        if(deltaT >= sample_period)
        {
            //fout.write((char*)&deltaT, sizeof(float));
            if(deltat_sq.write_available())
                deltat_sq.push(deltaT);
            deltaT = 0.0f;
            start = chrono::steady_clock::now();
            //-----------Start Collect Data From Sensor----------------
            accRaw = mpu.read_acc_raw();
            gyrRaw = mpu.read_gyr_raw();
            magRaw = hmc.read_magnetometer_raw();
            //-----------Start Push Raw Data To sq------------
            if(gyr_sq.write_available())
                gyr_sq.push(gyrRaw);
            if(acc_sq.write_available())
                acc_sq.push(accRaw);
            if(mag_sq.write_available())
                mag_sq.push(magRaw);
            //-----------------------------------------------
            count++;
        }
        now = chrono ::steady_clock::now();
        deltaT = chrono::duration<float, milli>(now - start).count();
        if(count == sample_count)
            break;
    }
    //fout.close();
    cout << "data_produce end\n";
}
void calculate()
{
    SensorRaw g_r, a_r, m_r;
    Vector3 g_s, a_s, m_s;
    float deltat=0.0f;
    Vector3 vel(.0f, .0f, .0f), pos(.0f, .0f, .0f);
    while(1)
    {
        if(gyr_sq.read_available() && acc_sq.read_available() && mag_sq.read_available() && deltat_sq.read_available())
        {
            //-----------------取数据,量化数据-------------------------
            gyr_sq.pop(g_r);
            acc_sq.pop(a_r);
            mag_sq.pop(m_r);
            deltat_sq.pop(deltat);
            g_s = (g_r-mpu.gyr_offset) * (mpu.gyr_mScale*0.001);//unit deg/s
            a_s = (a_r-mpu.acc_offset) * (mpu.acc_mScale*0.001*9.81);//unit m/s^2
            m_s = m_r * (hmc.mScale*0.001);//gauss
            //--------------------滤波器参数设置------------------------------
            if(mc.active)
                ahrs.kp = 0;
            else
                ahrs.kp = 1.0f;
            ahrs.sample_period = deltat * 0.001f;
            //-------------
            g_s.x = 0;
            g_s.y = 0;
            m_s.z = 0;
            a_s.z = 0;
            //-------------
            ahrs.update(degtorad(g_s), m_s);
            Quaternion q_ac = conjugate(ahrs.q) * Quaternion(0.0f, a_s.x, a_s.y, a_s.z) * ahrs.q;
            Vector3 a_c = Vector3(q_ac.x, q_ac.y, q_ac.z);
            vel = vel + a_c * ahrs.sample_period;
            if(!mc.active)
                vel = 0.0f;
            pos = pos + vel * ahrs.sample_period;
        }
    }
}
void setup()
{
    mc.serialInit();
    Wire.begin();
    mpu.set_clock_source();
    mpu.set_acc_scale(parameter[0]);
    mpu.set_gyr_scale(parameter[1]);
    //Sample Rate = Gyroscope Output Rate / (1 + SMPLRT_DIV)
    mpu.setSampleRate(parameter[2]);
    hmc.set_scale(HMC5883L::M_SCALE_1P3);
    hmc.set_measurement_mode();
    mc.adjust_speed(parameter[5]);
    delay(100);

}

void loop(){}
int main()
{
    int i = 0;
	fstream parameterFin("./parameter.txt");
	string sparameter;
	for (char a[16]; parameterFin.getline(&a[0], 16);)
	{
		sparameter = a;
		if (i > 6)
		{
			cout << "parameter over number\n";
			exit(0);
		}
		parameter[i] = stoi(sparameter);
		i++;
	}
	parameterFin.close();
    cout << "Acclerater Scale : " << parameter[0] << "(g)\n"
         << "Gyrscope Scale : " << parameter[1] << "(deg)\n"
         << "MPU6050 SampleRate : " << 8000/(parameter[2]+1) << "(Hz)\n"
         << "Sample Number : " << parameter[3] << "\n"
         << "Sample Frequency : " << parameter[4] << "\n"
         << "Car PWM : " << parameter[5] << "\n";
    setup();

    return 0;
}
