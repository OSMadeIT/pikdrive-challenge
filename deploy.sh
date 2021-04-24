#!/usr/bin/env sh

# abort on errorsset -e
# buildyarn run build
# navigate into the build output directorycd dist
# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy pikdrive challenge'
git push -f https://github.com/OSMadeIT/pikdrive-challenge.git master:gh-pages
cd -