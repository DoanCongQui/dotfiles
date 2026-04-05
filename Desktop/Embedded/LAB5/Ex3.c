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

#define PWM_IOCTL_SET_FREQ 1
#define PWM_IOCTL_STOP 0

void set_buzzer_freq(int fd, int freq);
void stop_buzzer(int fd);

int main(void)
{
    printf("Press Ctrl-C to stop\n");
    int fd_adc = open("/dev/adc", 0);
    if (fd_adc < 0)
    {
        perror("open ADC device:");
        return 1;
    }

    // Set up the PWM buzzer device
    int fd_buzzer;
	char key = 0xff;
	fd_buzzer = open("/dev/pwm", 0);
	if (fd_buzzer < 0)
	{
		perror("open pwm_buzzer device");
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
            if(value >=0 && value <400){
                set_buzzer_freq(fd_buzzer, 400); // Set frequency to 500 Hz
                printf("Freq: 400 Hz\n");
            }
            else if(value >=400 && value <800){
                set_buzzer_freq(fd_buzzer, 800); // Set frequency to 800 Hz
                printf("Freq: 800 Hz\n");
            }
            else if(value >=800 && value <=1023){
                set_buzzer_freq(fd_buzzer, 1200); // Set frequency to 1200 Hz
                printf("Freq: 1200 Hz\n");
            }
        }
        else
        {
            perror("read ADC device:");
            return 1;
        }
        usleep(500* 1000);
    }
    stop_buzzer(fd_buzzer);
    close(fd_adc);
}

void set_buzzer_freq(int fd, int freq)
{
	// this IOCTL command is the key to set frequency
	int ret = ioctl(fd, PWM_IOCTL_SET_FREQ, freq);
	if(ret < 0)
	{
		perror("set the frequency of the buzzer");
		exit(1);
	}
}

void stop_buzzer(int fd)
{
	int ret = ioctl(fd, PWM_IOCTL_STOP);
	if(ret < 0)
	{
		perror("stop the buzzer");
		exit(1);
	}
	close(fd);
}