#!/bin/bash

shopt -s globstar

echo "<?xml version="1.0" encoding="UTF-8" standalone="yes"?>"
echo "  <ResourceList>"
echo "  <Name>Minecraft_Diverge_Beta_Rework_Resources</Name>"
echo "  <Attribution>"
cat ./ATTRIBUTION.txt | sed "s/^/    /"
echo ""
echo "  </Attribution>"

for f in ./**/*.ogg; do
  fr=$(realpath -s --relative-to=. $f)
  echo "  <Contents>"
  echo "    <Key>${f:2}</Key>"
  echo "    <Size>$(stat -c%s $f)</Size>"
  echo "  </Contents>"
done

echo "</ResourceList>"