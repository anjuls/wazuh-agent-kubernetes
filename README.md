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

# Steps
1. Review the content of `configmap.yaml` and change the installation script based on your operating system. 
2. Replace the `$MANAGER_IP` with Wazuh Manager IP address in `configmap.yaml` and replace `WORKER_IP` to wazuh worker ip in `ossec.conf`. 
3. Run `build.sh` to build the container and deploy Kubernetes objects.

Note: Container will be executed with `hostPID: true` and in privileged mode. 


References:
* https://github.com/wazuh/wazuh-kubernetes/
* https://github.com/NoEnv/docker-wazuh-agent
* https://github.com/patnaikshekhar/AKSNodeInstaller
