#!/bin/bash
# Deploy _site to GCS bucket, but only if this is a master (gh-pages) build.
set -e

BUCKET="gs://weasel-webrtc"
dir=$(dirname $0)

[ "$TRAVIS_PULL_REQUEST" != "false" ] && exit 0
[ "$TRAVIS_SECURE_ENV_VARS" != "true" ] && exit 0
[ "$TRAVIS_BRANCH" != "gh-pages" ] && exit 0

# The robot.json was encrypted using "travis encrypt-file" command.
# See the following for more details:
# https://docs.travis-ci.com/user/encrypting-files/.
openssl aes-256-cbc -d \
  -K $encrypted_8544588a4144_key -iv $encrypted_8544588a4144_iv \
  -in $dir/robot.json.enc -out $dir/robot.json

if [ ! -x $HOME/google-cloud-sdk/bin/gcloud ]; then
  rm -rf $HOME/google-cloud-sdk;
  curl https://sdk.cloud.google.com | bash;
fi

gcloud auth activate-service-account --key-file $dir/robot.json
gsutil version -l

# Remove non-web files.
rm -f _site/Gemfile*
# Sync the files, removing remote objects if there's no corresponding file.
gsutil -m rsync -d -r _site/ $BUCKET
# Copy over all existing files with appropriate gzip settings.
gsutil -m cp -z js,css,html,svg -r _site/* $BUCKET
# Update cache headers on all objects.
gsutil -m setmeta  -h 'Cache-Control:public,max-age=600' -r $BUCKET/*
