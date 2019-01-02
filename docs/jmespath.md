Title: jmespath

"JMESPath is a query language for JSON." - <http://jmespath.org>

# Links

- <https://github.com/jmespath/jp>
- <https://github.com/jmespath/jmespath.terminal>

# Examples

## Grab some kubernetes fields and remap them to be less deep

```
kubectl get po --all-namespaces -o json |
jp "items[*].{name: metadata.name, namespace: metadata.namespace, imagePullSecrets: spec.imagePullSecrets[*].name}"
```

Or filter only to non-default namespace where imagePullSecrets is populated

```
kubectl get po --all-namespaces -o json |
jp "items[?metadata.namespace != 'default' && spec.imagePullSecrets != null].{name: metadata.name, namespace: metadata.namespace, imagePullSecrets: spec.imagePullSecrets[*].name}"
```
