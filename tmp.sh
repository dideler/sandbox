#!/bin/bash

if [ `git log --pretty=%H ...refs/heads/master^` != `git ls-remote origin -h refs/heads/master | cut -f1` ]
then
  echo "Your branch has diverged from origin"
  git fetch --quiet
  git log HEAD..origin/master --oneline
fi

if test -e .
then
  echo 'Y'
else
  echo 'N'
fi
