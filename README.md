# Redis insight helm chart

This is a simple hands-on chart, that will allow you to deploy fast a redis official tool for observing your redis installation. Supports several features, such as auto provisioning for your redis DB's

## Related documentation

[Redis Insight documentation](https://redis.io/insight/)
[Redis Insight env variables](https://redis.io/docs/latest/operate/redisinsight/configuration/#preconfigure-database-connections-using-environment-variables)
[Redis installation via helm](https://github.com/bitnami/charts/tree/main/bitnami/redis)

## Requirements

You need to be installed on your tested system:

- Helm
- Docker
- Running Kubernetes cluster (Single-node is also ok)
- Running Redis installation, if you plan to test auto-provisioninig

## Notes
For simplicity, all deployments are single-scaled. You can adjust it for more serious tests **If you are using minikube, you will face some problems with NodePort service type, as minikube works with this objects not in the same way kubernetes does it. You will need to run a service tunnel. More info here**: https://minikube.sigs.k8s.io/docs/handbook/accessing/

## Chart specification
### values.yaml
Contains values needed for basic introductory and easy start to test out chart. Simple deployment without any provisioning. Browser access via port-forwarding for corresponding service

### test-values.yaml
Covers more options:
- Ingress
- DB provisioning

To provision you Redis - installation, **directory for json**, that stores all the information (in this chart - /data/preconfigured) **should be mounted**. And json should be put inside, as well as specific variable - **RI_PRE_SETUP_DATABASES_PATH** should be set.
Json generation is achieved from yaml transformation (**configmap.yaml**).
It is important to follow json structure, so that everything works fine.
You can find an example in **dbProvision** section of **test-values.yaml** file

## Usage
### basic installation
```bash
helm -n namespace install redis-insight ./ -f values.yaml
```
### installation with provisioning
```bash
helm -n namespace install redis-insight ./ -f values.yaml -f test-values.yaml
```