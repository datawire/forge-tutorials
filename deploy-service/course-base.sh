curl https://s3.amazonaws.com/datawire-static-files/forge/$(curl https://s3.amazonaws.com/datawire-static-files/forge/latest.url)/forge?x-download=katacoda -o /tmp/forge

curl -sL https://raw.githubusercontent.com/datawire/forge/master/install.sh | INSTALL_DIR=~/.bin/forge sh
docker run -d -p 5000:5000 --name registry registry:2
