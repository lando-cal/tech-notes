Title: calico

"Calico provides secure network connectivity for containers and virtual machine workloads." - <https://docs.projectcalico.org/v3.1/introduction/>

# Kubernetes Examples

Calico works in several environments, but these examples all apply to Kubernetes.

## Installation

<https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/>

## Show a bunch of info about your calico config

See also <https://docs.projectcalico.org/v2.0/reference/calicoctl/resources/>

```
for X in bgpPeer hostEndpoint ipPool node policy profile workloadEndpoint ; do
  echo "=========== $X"
  calicoctl get $X 2>/dev/null
done
```

# Links

- <https://docs.projectcalico.org/latest/>
- <https://docs.projectcalico.org/v2.0/reference/calicoctl/resources/>
- <https://kubernetes.io/docs/concepts/services-networking/network-policies/>
