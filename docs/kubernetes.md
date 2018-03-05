"Kubernetes is an open-source platform for automating deployment, scaling, and operations of application containers across clusters of hosts, providing container-centric infrastructure." - <https://kubernetes.io/docs/whatisk8s>

# cli usage

## kubeadm

"kubeadm: easily bootstrap a secure Kubernetes cluster." - `kubeadm --help`

- <https://github.com/kubernetes/kubeadm>

## kubectl

"kubectl controls the Kubernetes cluster manager." - `kubectl --help`

- <https://github.com/kubernetes/kubectl>

- `kubectl get nodes`
- `kubectl config get-contexts`
- `kubectl config use-context foo`
- `kubectl get pods`
- `kubectl describe pod foo`

# Quick and dirty installations

## kubespray

- <https://github.com/kubernetes-incubator/kubespray>

## Manually on Ubuntu 16

```
sudo swapoff -a # https://github.com/kubernetes/kubernetes/issues/53533
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo add-apt-repository "deb http://apt.kubernetes.io/ kubernetes-xenial main"
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
```

# Links

- <https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm>
- <https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster>
- <https://docs.projectcalico.org/v3.0/introduction/>
- <https://kubernetes.io/docs/reference/glossary/>
