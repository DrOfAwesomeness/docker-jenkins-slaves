mkdir -p /var/run/sshd
echo "** Setting passwords"
echo build:$PASSWORD | chpasswd
echo root:$ROOTPASSWORD | chpasswd
echo "** Installing OpenSSH"
apt-get install -y --no-install-recommends openssh-server > /dev/null
echo "** Allowing passworded root login"
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
if [ -f /start2.sh ]
then
    /bin/sh /start2.sh
else
    echo "** Starting SSH Server"
    /usr/sbin/sshd -D
fi
