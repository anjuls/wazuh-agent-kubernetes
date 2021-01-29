#!/bin/sh
# Purpose of this script is to install Wazuh configuration and run installation script
# on the EC2 node (Amazon Linux 2) on EKS worker node

# Copy installation script to host
cp /tmp/install.sh /host

# Copy wait script to the host 
cp /wait.sh /host

# copy ossec
cp /ossec.conf /host
cp /authd.pass /host

# Wait for updates to complete
/usr/bin/nsenter -t 1 -a -- chmod u+x /var/wait.sh

# Give execute priv to script
/usr/bin/nsenter -t 1 -a -- chmod u+x /var/install.sh

# Wait for Node updates to complete
/usr/bin/nsenter -t 1 -a /var/wait.sh


# If the /tmp folder is mounted on the host then it can run the script
/usr/bin/nsenter -t 1 -a /var/install.sh

# Sleep so that the Pod in the DaemonSet does not exit
sleep infinity