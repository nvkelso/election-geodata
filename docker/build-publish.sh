#!/bin/sh -ex

# First, check to see if there are any local changes
# in the repo and refuse to continue if any are found.
git update-index -q --refresh

if git diff-index --quiet HEAD --; then
    # Remember what Git commit and branch we are on.
    export GIT_SHA1=`git rev-parse HEAD`
    export GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
else
    echo 'Boo: there are local uncommitted changes.'
    exit 1
fi

# Render an image and a Geopackage output.
make clean out/render.png out/nation.gpkg

# Upload render for this commit and tell Github about it.
RENDER_PATH=$S3_BUCKET/commits/$GIT_SHA1/render.png
aws --region us-east-1 s3 cp --acl public-read out/render.png s3://$RENDER_PATH
scripts/update-status.py https://s3.amazonaws.com/$RENDER_PATH

# Check if we're on the deploy branch.
if [ $GIT_BRANCH = 'master' ]; then

    # Upload render and data for this branch.
    aws --region us-east-1 s3 cp --acl public-read --cache-control 'max-age=60 public' out/render.png s3://$S3_BUCKET/branches/$GIT_BRANCH/render.png
    ogr2ogr out/nation.shp out/nation.gpkg
    gzip -9 out/nation.gpkg
    aws --region us-east-1 s3 cp --acl public-read --content-encoding gzip --content-type application/geopackage out/nation.gpkg.gz s3://$S3_BUCKET/branches/$GIT_BRANCH/nation.gpkg
    zip -j out/nation.zip out/nation.shp out/nation.shx out/nation.prj out/nation.dbf
    aws --region us-east-1 s3 cp --acl public-read --content-type application/zip out/nation.zip s3://$S3_BUCKET/branches/$GIT_BRANCH/nation-shp.zip

fi
