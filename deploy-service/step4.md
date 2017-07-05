In order for your Kubernetes cluster to run an image, it needs to get a copy of the image.

We typically do this through a container registry: a central service that hosts images. There are dozens of options for container registries, for both on-premise and cloud-only use cases.

In this tutorial, we're going to use one of the more popular registries, the Docker Hub. If you don't have an account already, create an account at https://hub.docker.com.

Once you have the account, set up your Docker instance with the appropriate credentials:

`docker login`{{execute}}

Then, we can push the image we just created to Docker Hub:

`docker push hello-webapp:v1`{{execute}}
