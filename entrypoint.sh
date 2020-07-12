#!/bin/sh

echo "Debug information:"

IFS=$'\n'
for v in `env`; do
  PREFIX=$(echo $v| cut -d '_' -f1)

  if [[ $PREFIX == 'GITHUB' ]] || [[ $PREFIX == 'INPUT' ]]; then
    echo "$v";
  fi
done

echo "---"
echo "Event:"

jq $INPUT_JQ_SELECTOR $GITHUB_EVENT_PATH
