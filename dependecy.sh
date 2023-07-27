# Run this command in a separate terminal
# Installation script for alpine linux in kode kloud environment
# Check wheather it's alpine or not
cat /etc/os-release
echo -e "\e[1;32m ### Installation script started for Alpine Linux ### \e[0m"
apk add docker
echo -e "\e[1;32m ###Docker Installation Done### \e[0m"
addgroup root docker
echo -e "\e[1;32m ### docker added to root group ### \e[0m"
apk add openrc
echo -e "\e[1;32m ### openrc installation complete ### \e[0m"
apk add jq
echo -e "\e[1;32m ### jason viewer installation complete ### \e[0m"
apk add less
echo -e "\e[1;32m ### less package installation complete ### \e[0m"
apk add tree
echo -e "\e[1;32m ### tree command installed ### \e[0m"
echo -e "\e[1;31m ### Docker daemon started ### \e[0m"
dockerd
