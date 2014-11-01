mkdir -p /var/run/sshd
if [ -z "$SSHKEY" ]; then
    echo "** Setting passwords"
    echo build:$PASSWORD | chpasswd
    echo root:$ROOTPASSWORD | chpasswd
else
    echo "** Adding SSH key"
    mkdir -p /home/build/.ssh
    echo $SSHKEY > /home/build/.ssh/authorized_keys
    chown -R build:build /home/build/.ssh
fi
echo "** Installing OpenSSH"
apt-get install -y --no-install-recommends openssh-server > /dev/null
if [ -z "$SSHKEY" ]; then
    echo "** Allowing passworded root login"
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
else
    echo "** Disabling password authentication"
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config
fi
if [ -f /start2.sh ]; then
    /bin/sh /start2.sh
else
    echo "** Starting SSH Server"
    /usr/sbin/sshd -D
fi
