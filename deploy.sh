#!/bin/bash

echo "Building the site..."
hugo --cleanDestinationDir --minify

echo "Deploying to GitHub Pages..."
cd public
git init
git remote add origin https://github.com/hjkunst/hjkunst.github.io.git
git add .
git commit -m "Deploy site $(date)"
git push -f origin main

echo "Deployment complete!" 