curl -sL https://raw.githubusercontent.com/datawire/forge/master/install.sh | INSTALL_DIR=~/.bin/forge sh
docker run -d -p 5000:5000 --name registry registry:2
