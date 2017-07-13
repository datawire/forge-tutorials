In order for your Kubernetes cluster to run an image, it needs to get a copy of the image.

We typically do this through a container registry: a central service that hosts images. There are dozens of options for container registries, for both on-premise and cloud-only use cases.

In this tutorial, the Katacoda environment has provisioned a personal Docker Registry to store the built image. Set the URL for the Registry as an environment variable with the command:

`export REGISTRY=[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

In order to push the Docker Image to the registry, we need to create a tag for the Docker image that contains our Docker repository name.

`docker tag hello-webapp:v1 $REGISTRY/hello-webapp:v1`{{execute}}

Then, we can push the image we just created to the Docker Registry:

`docker push $REGISTRY/hello-webapp:v1`{{execute}}
