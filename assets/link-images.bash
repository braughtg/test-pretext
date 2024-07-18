#!/bin/bash

# Link each of the images folders here so they can
# be stored with their source and still get
# pulled into the built document.

rm -rf "assets/images"
mkdir "assets/images"

ln --symbolic --force \
   "../../source/shared-images" \
   "assets/images/shared-images"

ln --symbolic --force \
   "../../source/ch-introduction/images" \
   "assets/images/ch-introduction"

ln --symbolic --force \
   "../../source/ch-community-collaboration/images" \
   "assets/images/ch-community-collaboration"

ln --symbolic --force \
   "../../source/ch-communities-and-collaboration/images" \
   "assets/images/ch-communities-and-collaboration"

ln --symbolic --force \
   "../../source/ch-upstreaming-changes/images" \
   "assets/images/ch-upstreaming-changes"

ln --symbolic --force \
   "../../source/ch-staying-synchronized/images" \
   "assets/images/ch-staying-synchronized"

ln --symbolic --force \
   "../../source/ch-merge-conflicts/images" \
   "assets/images/ch-merge-conflicts"
   