curl https://s3.amazonaws.com/datawire-static-files/forge/$(curl https://s3.amazonaws.com/datawire-static-files/forge/latest.url)/forge?x-download=katacoda -o /tmp/forge
chmod a+x /tmp/forge
mv /tmp/forge ~/.bin
docker run -d -p 5000:5000 --name registry registry:2
