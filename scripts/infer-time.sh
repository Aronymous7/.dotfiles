#!/usr/bin/env bash

for i in {1..5}
do
  rm -rf infer-out/
  echo ""
  echo "----- RUN $i -----"
  echo ""
  infer --cost-only --keep-going -- $1
  $2
done
