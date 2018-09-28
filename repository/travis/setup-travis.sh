#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [path/to/new/repo/"
    exit 1
fi

if [if ! [ -x "$(command -v travis)" ]; then
  echo 'Error: travis is not installed.' >&2
  echo 'Install with brew install travis'
  exit 1
fi

cp .travis.yml.template $1/.travis.yml
cp .travis.settings.xml $1/.

read -p "Enter Slack API Token: " SLACK_TOKEN
travis encrypt $SLACK_TOKEN --add notifications.slack.rooms

read -p "Enter SonarCloud API Token: " SONAR_TOKEN
travis encrypt $SONAR_TOKEN --add addons.sonarcloud.token

