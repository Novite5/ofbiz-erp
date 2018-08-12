#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'ci-cd' ] ; then

ssh -oStrictHostKeyChecking=no $BLOCKFREIGHT_SSH_USER@$DROPLET_IP_ADDRESS "\
sudo docker compose down;\
sudo docker rmi ofbiz-erp_ofbiz;\
rm -rf ~/ofbiz;\
mkdir ~/ofbiz;\
cd ~/ofbiz;\
git clone https://github.com/blockfreight/ofbiz-erp.git .;\
sudo docker-compose up -d" <<-'ENDSSH'

ENDSSH
# sudo docker rmi ofbiz-erp_ofbiz;\
# sudo docker-compose --build
else
  echo "Not deploying, since this branch isn't master."
fi