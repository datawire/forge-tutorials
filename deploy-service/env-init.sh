apt-get install -y python-minimal python-pip
echo "installing virtualenv"
pip install virtualenv
echo "installing forge"
curl -sL https://raw.githubusercontent.com/datawire/forge/master/install.sh | INSTALL_DIR=${HOME}/forge sh
export PATH=$PATH:${HOME}/forge/bin
git clone https://github.com/datawire/hello-forge.git
