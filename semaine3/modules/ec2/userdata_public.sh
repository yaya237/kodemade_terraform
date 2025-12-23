#!/bin/bash
dnf update -y
curl -fsSL https://rpm.nodesource.com/setup_18.x | bash -
dnf install -y nodejs nginx
npm install -g @angular/cli
systemctl start nginx
systemctl enable nginx
