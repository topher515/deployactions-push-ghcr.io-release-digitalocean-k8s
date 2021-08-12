#!/bin/bash
TAG="$1"
MSG="$(git log -1 --pretty=%B)"
git tag -a -m "$MSG" "$TAG" && git push --follow-tags