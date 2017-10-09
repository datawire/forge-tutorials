export PATH=$PATH:~/.bin/ \
&& git clone https://github.com/datawire/hello-webapp.git \
&& export FORGE_SETUP_IMAGE=registry.hub.docker.com/datawire/forge-setup-test-katacoda:1 \
&& cat /proc/sys/kernel/random/uuid > hello-webapp/uuid.txt \
&& export LANG=C.UTF-8 && export LC_ALL=C.UTF-8
