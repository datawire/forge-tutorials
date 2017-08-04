export PATH=$PATH:~/.bin/forge/bin \
&& git clone https://github.com/datawire/hello-webapp.git \
&& export FORGE_SETUP_IMAGE=registry.hub.docker.com/datawire/forge-setup-test-katacoda:1 \
&& cat /proc/sys/kernel/random/uuid > hello-webapp/uuid.txt
