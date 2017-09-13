#!/bin/bash -ex

# First, check to see if there are any local changes
# in the repo and refuse to continue if any are found.
git update-index -q --refresh

if git diff-index --quiet HEAD --; then
    # Remember what Git commit and branch we are on.
    GIT_SHA1=`git rev-parse HEAD`
    GIT_BRANCH=`git rev-parse --abbrev-ref HEAD`
    STATUS_URL="https://api.github.com/repos/$GITHUB_USERNAME/$GITHUB_REPONAME/commits/$GIT_SHA1/statuses"
else
    echo 'Boo: there are local uncommitted changes.'
    exit 1
fi

# Tell Github we're working on it.
curl -v \
    -d '{"state":"pending","context":"elections","description":"Working on it..."}' \
    -u "$GITHUB_TOKEN:x-oauth-basic" \
    $STATUS_URL

# Tell Github we failed.
function admit_defeat
{
    curl -v \
        -d '{"state":"failure","context":"elections","description":"Argh."}' \
        -u "$GITHUB_TOKEN:x-oauth-basic" \
        $STATUS_URL
    
    exit 1
}

# Render an image and a Geopackage output.
make clean out/render.png out/nation.gpkg || admit_defeat

# Upload render for this commit and tell Github about it.
RENDER_PATH=$S3_BUCKET/commits/$GIT_SHA1/render.png
aws --region us-east-1 s3 cp --acl public-read out/render.png s3://$RENDER_PATH

# Tell Github everything worked.
curl -v \
    -d '{"state":"success","context":"elections","description":"Everything is awesome.","target_url":"https://s3.amazonaws.com/'$RENDER_PATH'"}' \
    -u "$GITHUB_TOKEN:x-oauth-basic" \
    $STATUS_URL

# Deploy if we're on the deploy branch.
if [ $GIT_BRANCH = 'master' ]; then

    # Upload render and data for this branch.
    BRANCH_DIR=$S3_BUCKET/branches/$GIT_BRANCH
    aws --region us-east-1 s3 cp --acl public-read --cache-control 'max-age=60 public' \
        out/render.png s3://$BRANCH_DIR/render.png

    gzip -9 out/nation.gpkg
    aws --region us-east-1 s3 cp --acl public-read --content-encoding gzip --content-type application/geopackage \
        out/nation.gpkg.gz s3://$BRANCH_DIR/nation.gpkg

    ogr2ogr out/nation.shp out/nation.gpkg
    zip -j out/nation.zip out/nation.shp out/nation.shx out/nation.prj out/nation.dbf
    aws --region us-east-1 s3 cp --acl public-read --content-type application/zip \
        out/nation.zip s3://$BRANCH_DIR/nation-shp.zip

fi
