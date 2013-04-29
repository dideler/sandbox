#!/bin/bash

if [ `git log --pretty=%H ...refs/heads/master^` != `git ls-remote origin -h refs/heads/master | cut -f1` ]
then
  echo "Your branch has diverged from origin"
  git fetch --quiet
  git log HEAD..origin/master --graph --abbrev-commit --date=relative \
    --pretty=format:"%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset"
fi

if !(`git push`)
then
  echo 'failed'
else
  echo 'passed'
fi

#if (`git push --quiet`)
#then
#  echo 'works'
#else
#  echo 'fails'
#fi

if test -e .
then
  echo 'Y'
else
  echo 'N'
fi
