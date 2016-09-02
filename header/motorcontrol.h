#ifndef MOTORCONTROL_H
#define MOTORCONTROL_H
class MotorControl
{
private:
    void commans(unsigned char * buffer, unsigned char length);
public:
    bool active;
    void serialInit();            //串口初始化
    void motorGoForward();         //前进
    void motorGoBack();            //倒退
    void motorGoStop();            //停止
    void turn_left();
    void turn_mid();
    void turn_right();
    void adjust_speed(unsigned char speed);
};


#endif // MOTORCONTROL_H
