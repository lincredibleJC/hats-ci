#!/bin/bash

echo -e "\n=========================="
echo -e "NVM node for Mac installer"
echo -e "==========================\n"

echo -e "\n===================================="
echo -e "Password is your login password"
echo -e "====================================\n"

sudo echo ""

echo -e "Install brew if currently not installed"
if [ ! -f /usr/local/bin/brew ]; then
	echo -e "	Installing Brew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update
fi

echo -e "Install Ansible if currenty not installed"
if [ ! -f /usr/local/bin/ansible-playbook ]; then
	echo -e "	Installing Ansible..."
	brew install ansible
else
	brew upgrade ansible
fi

echo -e "Running Playbooks"

ansible-playbook -i "localhost," -c local "ansible-playbook-install-nvm-node.yml"

echo -e "\n======================================================================="
echo -e "Install complete. In future, node will ready when 'source ~/.bash_profile'"
echo -e "=======================================================================\n"
