Kubernetes doesn't run your source code directly. Instead, you hand Kubernetes a container.

A container contains 1) a compiled version of your source code and 2) any/all runtime dependences necessary to run your source code.

In this tutorial, we're going to use Docker as our container format. We've created a simple web application in Python, the `hello-webapp`. To package the webapp as a Docker container, we create a `Dockerfile`.

We've created a `Dockerfile` for you, so just type to see its contents:

`cd hello-webapp`{{execute}}

`cat Dockerfile`{{execute}}

This Dockerfile starts with the base image (Alpine:3.5), installs the necessary Python dependencies for the webapp, exposes a port for the webapp on the container, and then specifies the command to run when the container starts.

You can build the Docker container manually with this command:

`docker build -t hello-webapp:v1 .`{{execute}}

This command reads the `Dockerfile`, and then builds a binary image that contains everything necessary for the webapp to run.
