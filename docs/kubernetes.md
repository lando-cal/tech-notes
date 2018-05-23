Title: kubernetes

"Kubernetes is an open-source platform for automating deployment, scaling, and operations of application containers across clusters of hosts, providing container-centric infrastructure." - <https://kubernetes.io/docs/whatisk8s>

# cli usage

## Learn about kubernetes

```
kubectl explain roles
```

## Multiple configs

The default config is `~/.kube/config`, but if you want to use multiple configs you can do this:

```
export KUBECONFIG="${HOME}/code/kubespray/artifacts/admin.conf:${HOME}/.kube/config"
```

I have seen weird problems when the order of configs is changed, such as `certificate-authority-data` and `client-certificate-data` being missing.

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

# Installations

## kubespray

- <https://github.com/kubernetes-incubator/kubespray>

## Ansible on Ubuntu 16

<https://github.com/entercloudsuite/ansible-kubernetes>

```
ansible-galaxy install entercloudsuite.kubernetes
```

## Manually on Ubuntu 16


- First install Docker - <https://docs.docker.com/install/linux/docker-ce/ubuntu/>

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

Then start at `kubeadm init` on this guide: <https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm/#instructions>

# Links

- <http://on-demand.gputechconf.com/gtc/2018/presentation/s8893-the-path-to-gpu-as-a-service-in-kubernetes.pdf>
- <http://on-demand.gputechconf.com/gtc/2018/video/S8893/>
- <http://slack.kubernetes.io/>
- <https://blog.hypriot.com/post/setup-kubernetes-raspberry-pi-cluster>
- <https://docs.projectcalico.org/v3.0/introduction/>
- <https://github.com/kelseyhightower/kubernetes-the-hard-way> - "The target audience for this tutorial is someone planning to support a production Kubernetes cluster and wants to understand how everything fits together."
- <https://github.com/kinvolk/kubernetes-the-hard-way-vagrant> - "A port of Kelsey Hightower's 'Kubernetes the Hard Way' tutorial to Vagrant."
- <https://github.com/kubernetes/dashboard#kubernetes-dashboard>
- <https://github.com/kubernetes/kompose> - Compose to Kubernetes
- <https://kubernetes.io/docs/concepts/cluster-administration/addons/>
- <https://kubernetes.io/docs/concepts/cluster-administration/logging/>
- <https://kubernetes.io/docs/concepts/workloads/controllers/deployment/>
- <https://kubernetes.io/docs/getting-started-guides/minikube/>
- <https://kubernetes.io/docs/reference/glossary/>
- <https://kubernetes.io/docs/setup/independent/create-cluster-kubeadm>
- <https://www.cncf.io/certification/expert/CKA/>
