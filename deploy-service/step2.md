Congratulations! You've successfully encapsulated the webapp and *everything needed to run the webapp* in a container, from the operating system (Alpine Linux) to the runtime environment (Python) to the actual app (hello world).

Let's run the container:

`docker run -d -p 80:8080 hello-webapp:v1`{{execute}}

(This command runs the container, and maps the container's port 8080 to the hosts port 80.) We can verify that the webapp is running successfully:

`curl host01`{{execute}}

(We're now sending an HTTP request to port 80 on host01, which then maps to the 8080 in the container.)
