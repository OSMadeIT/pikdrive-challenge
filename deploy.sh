#!/usr/bin/env sh

# abort on errors
set -e
# build
yarn run build
# navigate into the build output directory
cd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy pikdrive challenge'
git push -f https://github.com/OSMadeIT/pikdrive-challenge.git master:gh-pages
cd -