#!/bin/sh

# install daemontools
pkg install daemontools
echo 'svscan_enable="YES"' >> /etc/rc.conf
# copy config file
cp etc/botsh.conf /usr/local/etc
# copy bin files
for f in `ls bin/`
do
  cp bin/$f /usr/local/bin/$f
  chmod +x /usr/local/bin/$f
done
# create daemontools directory
mkdir -p /var/service/botsh/log/main
cp daemontools/service_run /var/service/botsh/run
chmod +x /var/service/botsh/run
cp daemontools/log_run /var/service/botsh/log/run
chmod +x /var/service/botsh/log/run
echo
echo "Edit /usr/local/etc/botsh.conf"
echo "Start: /usr/local/etc/rc.d/svscan start"
