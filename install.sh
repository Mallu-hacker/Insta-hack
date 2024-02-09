#!/bin/bash
# Author: github.com/thelinuxchoice
# Instagram: @thelinuxchoice

# Check if the user has root privileges using sudo
if [[ "$(id -u)" -ne 0 ]]; then
    printf "\e[1;77mPlease run this script as root!\n\e[0m"
    exit 1
fi

# Install TOR if not already installed
(trap '' SIGINT SIGTSTP && command -v tor > /dev/null 2>&1 || { 
    printf "\e[1;92mInstalling TOR, please wait...\n\e[0m"
    apt-get update > /dev/null && apt-get -y install tor > /dev/null || printf "\e[1;91mTor installation failed.\n\e[0m"
}) & wait $!

# Install OpenSSL if not already installed
(trap '' SIGINT SIGTSTP && command -v openssl > /dev/null 2>&1 || {
    printf "\e[1;92mInstalling OpenSSL, please wait...\n\e[0m"
    apt-get update > /dev/null && apt-get -y install openssl > /dev/null || printf "\e[1;91mOpenSSL installation failed.\n\e[0m"
}) & wait $!

# Install cURL if not already installed
(trap '' SIGINT SIGTSTP && command -v curl > /dev/null 2>&1 || {
    printf "\e[1;92mInstalling cURL, please wait...\n\e[0m"
    apt-get update > /dev/null && apt-get -y install curl > /dev/null || printf "\e[1;91mcURL installation failed.\n\e[0m"
}) & wait $!

printf "\e[1;92mAll required dependencies are installed!\n\e[0m"
