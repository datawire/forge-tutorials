Your service is now on Hacker News, and you want to create a custom greeting. So let's change some of the source code:

`sed -i -e 's/Hello World!/Hello Hacker News!!!/' app.py`{{execute}}

We could rebuild the container, push it to the registry, and edit the deployment, but you've probably already forgotten all the exact commands, right?

Luckily, [Forge](http://forge.sh?utm_source=katacoda&utm_medium=tutorial&utm_campaign=tutorial) is an open source tool for deploying services onto Kubernetes, and it already does the automation (and then some!). Let's try using Forge to do this deployment. We need to do a quick setup of Forge:

`forge setup`{{execute}}

Use the default registry supplied, enter in your Docker Hub username/password, and use your username as the organization (the default). Now, type:

`forge deploy`{{execute}}

Forge will automatically build your Docker container (based on your `Dockerfile`), push the container to your Docker registry of choice, build a `deployment.yaml` file for you that points to your image, and then deploy the container into Kubernetes.

This process will take a few moments as Kubernetes terminates the existing container and swaps in the new code. Check on the status of the update:

`kubectl get pods`{{execute}}

This command will list the pods (which are logical groupings of containers), and you should see a hello-webapp pod terminating, and new hello-webapp initializing. Once the new hello-webapp pod says "Running", we can send a request to our container, and we'll see that we have a new welcome message:

`curl $WEBAPP_IP`

Congratulations! You've applied the basic concepts necessary for you to develop and deploy source code into Kubernetes.
