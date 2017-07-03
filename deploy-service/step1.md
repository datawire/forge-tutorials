Kubernetes doesn't run your source code directly. Instead, you hand Kubernetes a container.

What's in a container?

* A compiled version of your source code
* Any/all runtime dependences necessary to run your source code

In this tutorial, we're going to use Docker as our container format. We've created a simple web application in Python, the `hello-webapp`. To package the webapp as a Docker container, we create a `Dockerfile`.

<pre class="file" data-filename="Dockerfile" data-target="replace">
# Run server
FROM alpine:3.5
RUN apk add --no-cache python py2-pip py2-gevent
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . /app
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app.py"]
</pre>


 To get started, we've created a simple Python web application


* Build a Docker image containing your code
* Writing a Kubernetes manifest
* Then running `kubectl`

We're first going to create a Dockerfile.

To set up the environment, run `env-setup.sh`{{execute}}
