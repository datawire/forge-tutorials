Deploying code into Kubernetes requires a few steps.

* Build a Docker image containing your code
* Writing a Kubernetes manifest
* Then running `kubectl`

We're first going to create a Dockerfile.

To set up the environment, run `env-setup.sh`{{execute}}
