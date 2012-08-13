#!/bin/sh

FILES="site_code/heap.js 
site_code/twitter.utils.js 
site_code/main.js"

cat $FILES > app.js
cat $FILES | uglifyjs > app.min.js
du -h app.js app.min.js
