We've packaged up our service, and now it's time to get it running in Kubernetes.

Why do you need Kubernetes? In short, Kubernetes takes care of all the details of running a container: which VM/server to run the container on, making sure the container has the right amount of memory/CPU/etc., and so forth.

In order for Kubernetes to know how to run your container, you need a Kubernetes manifest.

We've created a Kubernetes manifest file for the hello-webapp service.

`cat deployment.yaml`{{execute}}

You can see that the manifest is written in YAML, and contains some key bits of information about your service, including a pointer to the Docker image, memory/CPU limits, and ports exposed.

So now we have 1) the code to be run, in a container and 2) the runtime configuration of how to run the code, in the Kubernetes manifest.

We now need one more component before we can actually run our container -- a container registry.
