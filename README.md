# Wazuh Agent Installer on Kubernetes Nodes

In the native wazuh, there was no option available to deploy agents on Kubernetes nodes automatically in native way. Though wazuh can be installed on Kubernetes using [https://github.com/wazuh/wazuh-kubernetes/](https://github.com/wazuh/wazuh-kubernetes/) but it doesn't have a way to install agents.

Please change the configuration based on your need and setup. 

```
.
├── authd.pass
├── build.sh
├── Dockerfile
├── k8s
│   ├── configmap.yaml
│   └── daemonset.yaml
├── ossec.conf
├── README.md
├── runOnHost.sh
└── wait.sh
```
# OSSEC Agent Configuration

|Feature|Enabled|
|---|---|
|Rootkit Check|Enabled|
|CIS-CAT|Disabled|
|Osquery|Disabled|
|System Inventory|Enabled|
|SCA | Enabled|
|File Integrity Monitoring|Enabled|
|Local `df -P`|Enabled|
|Local `netstat`|Enabled|
|Local `last -n 20`|Enabled|
|Syslog, yum.log | Enabled|
|Vulnerability Detector | Enabled|
| AWS-S3|Disabled|


# Instructions
1. Review the content of `k8s/configmap.yaml` and change the installation script based on your operating system. 
2. Replace the `$MANAGER_IP` with Wazuh Manager IP address in `configmap.yaml` and replace `WORKER_IP` to wazuh worker ip in `ossec.conf`. 
3. Run `build.sh` to build the container and deploy Kubernetes objects.

Note: Container will be executed with `hostPID: true` and in privileged mode. 


# References:
* https://github.com/wazuh/wazuh-kubernetes/
* https://github.com/NoEnv/docker-wazuh-agent
* https://github.com/patnaikshekhar/AKSNodeInstaller
