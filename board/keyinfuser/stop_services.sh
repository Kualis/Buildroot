#!/bin/sh

# First we kill the KI processes or services
echo "Check if some KI services are running"
services_array=($(ps aux | grep .*Ssl.*[K]I_.* | awk '{print  substr($11, 20, 30)}')) # we store the services name in $
echo "${#services_array[@]} service(s) to stop"
#sleep 2

for i in ${services_array[@]};
do
	if [ $i = "KI_main_program" ];
		then echo "LOL"
		main_number=$(pgrep $i)
		echo $main_number
		kill -9 $main_number
	fi
done

for i in ${services_array[@]};
do
        echo "Stop $i service..."
        systemctl stop $i; # We stop each service
done

echo "Check if some KI executables are running"
process_array=($(ps aux | grep .*Sl+.*[K]I_.* | awk '{print $2}'))
echo "${#process_array[@]} process to stop"
#sleep 2

for i in ${process_array[@]};
do
        echo "Stop $i service..."
        kill -9 $i; # We stop each service
done
