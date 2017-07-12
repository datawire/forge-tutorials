Now, let's actually get this service running in Kubernetes. We're going to need to update our `deployment.yaml` file to point to the image for our particular service. For the purposes of this exercise, we've templated our deployment file with the variable IMAGE_URL, which we'll then instantiate with a `sed` command:

`sed -i -e 's@IMAGE_URL@'"$REGISTRY/hello-webapp:v1"'@' deployment.yaml`{{execute}}

(f you run `cat deployment.yaml`{{execute}} you'll see that your specific Docker repository is now in the `deployment.yaml` file.)

To gain access to the Kubernetes cluster, the Kubernetes configuration file needs to be downloaded from the master. The configuration file contains the IP addresses and certificates required to communicate securely with Kubernetes.

`scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no root@host01:/root/.kube/config ~/.kube/`{{execute}}

Now, we can run actually get the service running:

`kubectl apply -f deployment.yaml`{{execute}}

We're telling Kubernetes to actually process the information in the manifest.

We can see the services running:

`kubectl get services`{{execute}}

## Accessing the cluster

Now, we want to send an HTTP request to the service. Most Kubernetes services are not exposed to the Internet, for obvious reasons. So we need to be able to access services that are running in the cluster directly.

`kubectl get pods`{{execute}}

When the service was deployed, a dynamic NodePort was assigned to the Pod. This can be accessed via `kubectl get svc`{{execute}}

Store the port assigned as a variable for later use.

`export PORT=$(kubectl get svc hello-webapp -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')`

We can now send an HTTP request to the service:

`curl host01:$PORT`{{execute}}

You'll see the "Hello, World" message again. Congratulations, you've got your service running in Kubernetes!

# The four pieces required for deployment

We've just performed four main things 1) created a container 2) created the Kubernetes manifest 3) pushed the container to a registry and 4) finally told Kubernetes all about these pieces with an updated manifest.

So, this was a bunch of steps, and if you have to do this over-and-over again (as you would for development), this would quickly grow tedious. Let's take a quick look at how we might script these steps so we could create a more useable workflow.
