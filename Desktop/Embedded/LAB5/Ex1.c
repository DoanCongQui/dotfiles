#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>
#include <linux/fs.h>
#include <errno.h>
#include <string.h>

#define ON 1
#define OFF 0

void led_control(int fd_led, int led_num);

int main(void)
{
    printf("Press Ctrl-C to stop\n");
    int fd_adc = open("/dev/adc", 0);
    if (fd_adc < 0)
    {
        perror("open ADC device:");
        return 1;
    }

    // Set up the LED device
    int fd_led = open("/dev/leds", 0);
    if (fd_led < 0) {
        perror("open device leds");
        exit(1);
    }

    while(1)
    {
        char buffer[30];
        int len = read(fd_adc, buffer, sizeof buffer -1);
        if (len > 0)
        {
            buffer[len] = '\0';
            int value = -1;
            sscanf(buffer, "%d", &value);//doc du lieu theo dinh dang
            printf("ADC Value: %d\n", value);

            if (value >= 0 && value < 128) {
                led_control(fd_led, 0); // Turn on LED 0
            } else if (value >= 128 && value < 256) {
                led_control(fd_led, 1); // Turn on LED 1
            } else if (value >= 256 && value < 512) {
                led_control(fd_led, 2); // Turn on LED 2
            } else if (value >= 512 && value <= 1023) {
                led_control(fd_led, 3); // Turn on LED 3
            }
        }
        else
        {
            perror("read ADC device:");
            return 1;
        }
        usleep(500* 1000);
    }
    close(fd_adc);
}

void led_control(int fd_led, int led_num) {
    int i;
    for (i = 0; i < 4; i++) {
        if (i == led_num) {
            ioctl(fd_led, ON, i); // Turn on the specified LED
        } else {
            ioctl(fd_led, OFF, i); // Turn off the other LEDs
        }
    }
}