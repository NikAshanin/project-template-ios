#!/bin/sh

PROJECT_NAME=$1
PROJECTS_PATH=$2

cd $PROJECTS_PATH

echo $PROJECT_NAME | liftoff

cd $PROJECT_NAME

git submodule add --name code-quality git@github.com:TouchInstinct/code-quality-ios.git

ln -s code-quality/.swiftlint.yml .swiftlint.yml
ln -s code-quality/cpd_script.php cpd_script.php

git add .swiftlint.yml
git add cpd_script.php

git commit --amend -m "Initial commit"
