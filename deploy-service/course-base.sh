curl -sL https://raw.githubusercontent.com/datawire/forge/master/install.sh | INSTALL_DIR=~/.bin/forge sh
export FORGE_SETUP_IMAGE=registry.hub.docker.com/datawire/forge-setup-test-katacoda:1
docker run -d -p 5000:5000 --name registry registry:2
