#!/usr/bin/env bash
# Copyright 2021  Jiayu Du
#                 Seasalt AI, Inc (Author: Guoguo Chen)


set -e

if [ $# -ne 1 ]; then
  echo "Usage: $0 <gigaspeech-src>"
  echo " e.g.: $0 ~/gigaspeech_data"
  echo ""
  echo "This script lists the audio files that are not used in the current"
  echo "dataset release."
  exit 1
fi

gigaspeech_src=$1

if ! which jq >/dev/null; then
  echo "$0: You have to get jq installed in order to use this. See"
  echo "$0: utils/install_jq.sh"
  exit 1
fi

cat $gigaspeech_src/GigaSpeech.json | jq -r '.audios[].path' || exit 1

echo "$0: Done"
