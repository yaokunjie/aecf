#include "AHRS.h"
#include <math.h>

AHRS::AHRS()
{
    sample_period = 0.0f;
    kp = 0.0f;
    kp_init = 0.0f;
    ki = 0.0f;
    init_period = 2;
    int_error = Vector3(0.0f, 0.0f, 0.0f);
    q = Quaternion(1.0f, 0.0f, 0.0f, 0.0f);
}

AHRS::AHRS(float sp, float k_p, float k_p_init)
{
    sample_period = sp;
    kp = k_p;
    kp_init = k_p_init;
    ki = 0.0f;
    init_period = 2;
    int_error = Vector3(0.0f, 0.0f, 0.0f);
    q = Quaternion(1.0f, 0.0f, 0.0f, 0.0f);
}

void AHRS::update(Vector3 gyr, Vector3 mag)
{
    mag.normalize();
    Quaternion q_memsure_coor(0.0f, 0.0f, 1.0f, 0.0f);
    Quaternion q_estimate = this->q * q_memsure_coor * conjugate(this->q);
    Vector3 error = crossProduct(Vector3(q_estimate.x, q_estimate.y, q_estimate.z), mag);
    int_error += error;
    Vector3 ref_gyr = gyr - (error * kp + int_error * ki);
    Quaternion p_dot = (Quaternion(0.0f, ref_gyr.x, ref_gyr.y, ref_gyr.z) * this->q) * 0.5f;
    this->q = this->q + p_dot * this->sample_period;
    this->q.normalize();
}
float AHRS::get_heading()
{
    Quaternion q_h = conjugate(this->q);
    return radtodeg(atan2(2*(q_h.x*q_h.y - q_h.w*q_h.z), 2*(q_h.w*q_h.w-1+2*q_h.x*q_h.x)));
}
Vector3 radtodeg(const Vector3& a)
{
    Vector3 result;
    result.x = a.x * 180.0f/M_PI;
    result.y = a.y * 180.0f/M_PI;
    result.z = a.z * 180.0f/M_PI;
    return result;
}
Vector3 degtorad(const Vector3& a)
{
    Vector3 result;
    result.x = a.x * M_PI/180.0f;
    result.y = a.y * M_PI/180.0f;
    result.z = a.z * M_PI/180.0f;
    return result;
}
float radtodeg(const float& a)
{
    return a * 180.0f/M_PI;
}
float degtorad(const float& a)
{
    return a * M_PI/180.0f;
}
