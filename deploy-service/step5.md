Now, let's actually get this service running in Kubernetes. We do this with the `kubectl` command:

`kubectl apply -f deployment.yaml`{{execute}}

We're telling Kubernetes to actually process the information in `deployment.yaml`.

We can see the service running:

`kubectl get services`

And then if we `curl` to the IP address listed for the `hello-webapp`:

`curl $WEBAPP_IP`

You'll see the "Hello, World" message again. Congratulations, you've got your service running in Kubernetes!

# Four steps

We've just performed four main things 1) created a container 2) created the Kubernetes manifest 3) pushed the container to a registry and 4) finally told Kubernetes all about these pieces.

So, this was a bunch of steps, and if you have to do this over-and-over again (as you would for development), this would quickly grow tedious. Let's take a quick look at how we might script these steps so we could create a more useable workflow.
