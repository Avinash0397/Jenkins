#!/bin/bash

# Update system packages
sudo apt-get update -y

# Install Java 17 or higher (Jenkins requires Java)
# Adoptium Temurin JDK is recommended
sudo apt-get install -y openjdk-17-jdk

# Verify Java installation
java -version

# Download and add the Jenkins repository signing key
sudo mkdir -p /etc/apt/keyrings
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add the Jenkins Debian repository to APT sources
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update local package index to recognize the new repository
sudo apt-get update -y

# Install Jenkins
sudo apt-get install jenkins -y

# Start the Jenkins service and enable it to start at boot
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Check the status of the Jenkins service
sudo systemctl status jenkins
