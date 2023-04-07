#!/bin/bash
#set -x
wpath='~/toolbox'
echo -e "Processing..."
# jpg -> webp
find "$wpath/img-to-webp" -type f -name "*.jpg" -print0 | while read -d $'\0' e;do
  file=$(printf '%s\n' "${e%.jpg}")
  if [ ! -f "$file.webp" ];then
    cwebp -quiet -q 90 "$e" -o "${e%.*}.webp" && rm "$e"
  else
    rm "$e"
  fi
done
# png -> webp
find "$wpath/img-to-webp" -type f -name "*.png" -print0 | while read -d $'\0' e;do
  file=$(printf '%s\n' "${e%.png}")
  if [ ! -f "$file.webp" ];then
    cwebp -quiet "$e" -o "${e%.*}.webp" && rm "$e"
  else
    rm "$e"
  fi
done
echo -e "Done."
exit 0
