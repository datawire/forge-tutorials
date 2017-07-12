Your service is now on Hacker News, and you want to create a custom greeting. So let's change some of the source code:

`sed -i -e 's/Hello World!/Hello Hacker News!!!/' app.py`{{execute}}

We could rebuild the container, push it to the registry, and edit the deployment, but you've probably already forgotten all the exact commands, right?

Luckily, [Forge](http://forge.sh?utm_source=katacoda&utm_medium=tutorial&utm_campaign=tutorial) is an open source tool for deploying services onto Kubernetes, and it already does the automation (and then some!). Let's try using Forge to do this deployment. We need to do a quick setup of Forge:

`forge setup`{{execute}}

To setup Forge, enter the URL for our Docker Registry: `[[HOST_SUBDOMAIN]]-5000-[[KATACODA_HOST]].environments.katacoda.com`{{execute}}

Enter the username for the Registry, in this case `root`{{execute}}

Enter the organization, again `root`{{execute}}

Finally, enter `root`{{execute}}

With Forge configured, type:

`forge deploy`{{execute}}

Forge will automatically build your Docker container (based on your `Dockerfile`), push the container to your Docker registry of choice, build a `deployment.yaml` file for you that points to your image, and then deploy the container into Kubernetes.

This process will take a few moments as Kubernetes terminates the existing container and swaps in the new code. We'll need to set up a new port forward command. Let's get the pod status again:

`kubectl get pods`{{execute}}

As previously, obtain the NodePort assigned to our deployment.

`export PORT=$(kubectl get svc hello-webapp -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')`

Now, let's check out our new welcome message:

`curl host01:$PORT`{{execute}}

Congratulations! You've applied the basic concepts necessary for you to develop and deploy source code into Kubernetes.
