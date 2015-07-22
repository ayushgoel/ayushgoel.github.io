#!/usr/bin/env bash

set -o errexit

print_help () {
    echo "Usage: ./publish.sh <path-to-post-file> <title-of-post> <tags>"
    echo "Note: assumes post file to be markdown"
}

path=$1
title=$2
tags=${*:3}

if test ! -f "$path"
then
    print_help
    exit 1
fi

if test -z "$title"
then
    print_help
    exit 1
fi

post_name=$(python lib/create-post/filename.py --title "$title" --ext md)
post_path="_posts/$post_name"
post_front_matter=$(python lib/create-post/front_matter.py --tags $tags)

echo $"$post_front_matter" | cat - "$path" > temp
mv temp $post_path

git add "$post_path"
git commit -m "Add post: $post_name"
git push
