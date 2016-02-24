#!/bin/sh
if [ "$#" -ne "1" ]; then
  echo "Usage: $0 <registry>"
  exit 1
fi

curl -sf https://$1/v2/_catalog | jq  -r '.["repositories"] | .[]' > repo_list

while read REPO
do
  echo -n >tag_list
  curl -sf https://hub.core.tf/v2/topface-base/tags/list | jq -r '.["tags"] | .[]' > tag_list
  while read TAG
  do
    echo ${REPO}:${TAG}
  done < tag_list
done < repo_list


