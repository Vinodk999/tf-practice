#!/bin/bash

dnf install -y wget

wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/rpm-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

dnf install -y fontconfig java-21-openjdk

dnf install -y jenkins

systemctl daemon-reload
systemctl enable jenkins
systemctl start jenkins

hostnamectl set-hostname Admin-Server