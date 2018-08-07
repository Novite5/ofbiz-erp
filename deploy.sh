#!/bin/bash
set -xe

if [ $TRAVIS_BRANCH == 'master' ] ; then
  eval "$(ssh-agent -s)"
  ssh-add ENV_DEPLOY_KEY

  cd public
  git init

  git remote add deploy "deploy@$ENV_VIRTUAL_HOST:~/ofbiz"
  git config user.name "deploy"
  git config user.email "$ENV_LETSENCRYPT_EMAIL"

  git add .
  git commit -m "Deploy"
  git push --force deploy master
else
  echo "Not deploying, since this branch isn't master."
fi