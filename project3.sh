#!/bin/bash
c="true"
while [ "$c" == "true" ]
do
        now=$(date)
        echo "$now"
        echo "-----------------------------------"
        echo "Main Menu"
        echo "-----------------------------------"
        echo "1. Operating system info"
        echo "2. Hostname and DNS info"
        echo "3. Network info"
        echo "4. Who is online"
        echo "5. Last logged in users"
        echo "6. My IP address"
        echo "7. My disk usage"
        echo "8. My home file-tree"
        echo "9. Process operations"
        echo "10. Exit"
        read -p "Enter your choice [1 - 10] " option
	if [ $option -eq 10 ]
	then
		c="false"
	fi
	if [ $option -eq 1 ]
	then
		echo "-----------------------------------"
		echo "System information"
		echo "-----------------------------------"
		echo "Operating system : Linux"
		si=$(/usr/bin/lsb_release -a)
		echo "$si"
	fi
	if [ $option -eq 2 ]
	then 
		echo "-----------------------------------"
                echo "Hostname and DNS information"
                echo "-----------------------------------"
		host=$(hostname -f)
		echo "Hostname : $host"
		dnsname=$(domainname)
		echo "DNS domain : $dnsname"
		f=$(hostname)
		echo "Fully qualified domain name : $f"
		ip=$(hostname -i)
		echo "Network address (IP) : $ip" 	
		echo "DNS name servers (DNS IP) : ${dnsnips}"
	fi
	if [ $option -eq 3 ]
	then
		echo "-----------------------------------"
                echo "Network  information"
                echo "-----------------------------------"
		numni=$(ls -A /sys/class/net | wc -l)
		echo "Total network interfaces found : $numni"
		ni=$(ip link show)
		echo "*** IP Addresses Information ***"
		echo "$ni"
		echo "***********************"
		echo "*** Network routing ***"
		echo "***********************"
		krt=$(netstat -rn)
		echo "$krt"
		echo "*************************************"
		echo "*** Interface traffic information ***"
		echo "*************************************"
		kit=$(netstat -i)
		echo "$kit"
	fi	
	if [ $option -eq 4 ]
	then
		echo "-----------------------------------"
                echo "Who is online"
                echo "-----------------------------------"
		w=$(who -H)
		echo "$w"
	fi
	if [ $option -eq 5 ]
	then
		echo "-----------------------------------"
                echo "List of last logged in users"
                echo "-----------------------------------"
		l=$(last -n 1)
		echo "$l"

	fi	
	if [ $option -eq 6 ]
	then
		echo "-----------------------------------"
                echo "Public IP information"
                echo "-----------------------------------"
		i=$(dig +short myip.opendns.com @resolver1.opendns.com)
		echo "$i"
	fi
	if [ $option -eq 7 ]
	then
		echo "-----------------------------------"
                echo "Disk Usage Info"
                echo "-----------------------------------"
		d=$(df -kh | awk '{print $5"	"$1}')
		echo "$d"
	fi
	if [ $option -eq 8 ]
	then
		./proj1.sh ~/ ./filetree.html
	fi	
	if [ $option != 10 ]
	then
		read -p "Press [Enter] key to continue..." enter
                if [ "$enter" == "" ]
                then
                        continue
                fi
	fi
done

