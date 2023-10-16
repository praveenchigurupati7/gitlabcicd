#!/bin/bash

sudo yum install -y yum-utils
sudo yum -y install terraform curl

curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash
sudo yum install gitlab-runner
