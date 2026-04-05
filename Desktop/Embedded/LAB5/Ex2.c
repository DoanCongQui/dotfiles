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

void led_control(int fd_led, int time);

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
            if(value >= 0 && value <= 300){
                led_control(fd_led, 300); // Blink LEDs with 300 ms delay
            }
            else if(value > 300 && value <= 600){
                led_control(fd_led, 600); // Blink LEDs with 600 ms delay
            }
            else if(value > 600 && value <= 900){
                led_control(fd_led, 900); // Blink LEDs with 900 ms delay
            }
            else if(value > 900 && value <= 1023){
                led_control(fd_led, 1100); // Blink LEDs with 1100 ms delay

        }
        else
        {
            perror("read ADC device:");
            return 1;
        }
        // usleep(500* 1000);
        }
        close(fd_adc);
    }
}

void led_control(int fd_led, int time) {
    int i;
    for (i = 0; i < 4; i++) {
        ioctl(fd_led, ON, i); // Turn on all LEDs
        usleep(time * 1000); // Wait for the specified time
        ioctl(fd_led, OFF, i); // Turn off all LEDs
        usleep(time * 1000); // Wait for the specified time
    }
}