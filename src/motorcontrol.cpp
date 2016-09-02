#include "motorcontrol.h"
#include "Arduino.h"
#include <iostream>

void MotorControl::serialInit()
{
    init();
    Serial.begin(115200);
    std::cout << "Wait Serial Open...\n";
    while(!Serial);
    std::cout << "Open Serial Success!!!\n";
}
void MotorControl::commans(unsigned char * buffer, unsigned char length)
{
    for(int i=0;i<length;i++)
    {
     Serial.write(buffer[i]);
    }
    delay(5);
}
void MotorControl::motorGoStop()
{
    unsigned char buffer[5] = {0xFF, 0x00, 0x00, 0x00, 0xFF};
    commans(buffer, (unsigned char)5);
    active = false;
}

void MotorControl::motorGoForward()
{
    unsigned char buffer[5] = {0xFF, 0x00, 0x01, 0x00, 0xFF};
    commans(buffer, (unsigned char)5);
    active = true;
}
void MotorControl::motorGoBack()
{
    unsigned char buffer[5] = {0xFF, 0x00, 0x02, 0x00, 0xFF};
    commans(buffer, (unsigned char)5);
    active = true;
}
void MotorControl::turn_left()
{
    unsigned char buffer[5] = {0xFF, 0x01, 0x07, 0x00, 0xFF};
    commans(buffer, (unsigned char)5);
}
void MotorControl::turn_right()
{
    unsigned char buffer[5] = {0xFF, 0x01, 0x09, 0x00, 0xFF};
    commans(buffer, (unsigned char)5);
}
void MotorControl::turn_mid()
{
    unsigned char buffer[5] = {0xFF, 0x01, 0x08, 0x00, 0xFF};
    commans(buffer, (unsigned char)5);
}
void MotorControl::adjust_speed(unsigned char speed)
{
    unsigned char buffer[5] = {0xFF, 0x02, 0x00, 0x00, 0xFF};
    buffer[2] = speed;
    commans(buffer, (unsigned char)5);
}
