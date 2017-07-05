Now, let's actually get this service running in Kubernetes. We're going to need to update our `deployment.yaml` file to point to our particular service. For the purposes of this exercise, we've templated our deployment file with the variable IMAGE_URL, which we'll then instantiate with a `sed` command:

`sed -i -e 's@IMAGE_URL@'"registry.hub.docker.com/$DOCKER_USER/hello-webapp:v1"'@' deployment.yaml`{{execute}}

Now, we can run `kubectl` to actually get the service running:

`kubectl apply -f deployment.yaml`{{execute}}

We're telling Kubernetes to actually process the information in `deployment.yaml`.

We can see the services running:

`kubectl get services`{{execute}}

And then if we `curl` to the EXTERNAL-IP address listed for the `hello-webapp`:

`curl $WEBAPP_IP`{{execute}}

Note that you may have to wait a moment for Kubernetes to allocate an external IP.

You'll see the "Hello, World" message again. Congratulations, you've got your service running in Kubernetes!

# The four pieces required for deployment

We've just performed four main things 1) created a container 2) created the Kubernetes manifest 3) pushed the container to a registry and 4) finally told Kubernetes all about these pieces with an updated manifest.

So, this was a bunch of steps, and if you have to do this over-and-over again (as you would for development), this would quickly grow tedious. Let's take a quick look at how we might script these steps so we could create a more useable workflow.
