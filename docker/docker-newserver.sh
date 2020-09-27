#!/bin/bash
source /etc/selinux/config

func_judge(){
	source /etc/init.d/functions
	if [ $? -ne 0 ]; then
	    action "$1 failed" /bin/false
	else
	    action "$1 success" /bin/true
	fi
}

function echo_green {
        echo -e "\033[32m$1\033[0m"
}

function echo_red {
        echo -e "\033[31m$1\033[0m" 
}

function echo_yellow {
        echo -e "\033[34m$1\033[0m"
}

if [ `command -v docker` ]; then
    echo_green "docker is installed"
else
    echo_green "docker is not installed, auto-download now"
    yum install -y docker
    func_judge "install docker"
    tee /etc/docker/daemon.json <<-'EOF'
	{
	  "registry-mirrors": ["https://kdp7pdnc.mirror.aliyuncs.com"]
	}
	EOF
    func_judge "change ali mirror"
    systemctl enable docker
fi

if [ $SELINUX == 'disabled' ]; then
    echo_green "the default of SElinux is closed"
else
    echo_red "the default of SElinux is opened"
    setenforce 0
    sed -i "s/SELINUX=$SELINUX/SELINUX=disabled/g" /etc/selinux/config
    echo_green "close the SElinux"
fi

echo `command -v docker`

if [ `command -v docker-compose` ]; then
    echo_green "docker-compose is installed"
else
    echo_red "docker-compose is not installed"
    curl -L https://github.com/docker/compose/releases/download/1.24.0-rc1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
    func_judge "install docker-compose"
fi

service docker start
echo_yellow "do you want change docker root path? y/n"

read answer
if [ $answer == "y" ] || [ $answer == "Y" ]; then
   echo_yellow "please input the new path: "
   read new_path
   cp -r /var/lib/docker $new_path
   func_judge "copy files"
   service docker stop
   mv /var/lib/docker /var/lib/docker.bk
   ln -s $new_path/docker /var/lib/docker
   func_judge "change docker root path"
   echo_green "back up docker to /var/lib/docker.bk"
fi
service docker start

if [ $? -ne 0 ]; then
	sed -i 's/overlay2/devicemapper/' /etc/sysconfig/docker-storage
	service docker start
	fi	
	
