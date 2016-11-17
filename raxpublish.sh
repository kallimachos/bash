#!/bin/bash
# coding: utf-8

# Helper script for publishing RPC documentation to pages.github.rackspace.com.
# Run from the master branch of your local clone of the internal
# RPC repository.

errexit() {
    # set output color if available and echo error message
    if test `tput -T $TERM colors` -lt 256; then
        echo -e $1
    else
        tput -T $TERM setaf 1
        echo -e $1
        tput -T $TERM sgr0
    fi
    exit 1
}

# check connection to github.rackspace.com
status=$(curl -s -m 5 --head -w %{http_code} https://github.rackspace.com/ \
        -o /dev/null)
statusfail='ERROR: Cannot connect to github.rackspace.com.\n
Are you connected to the Rackspace network?\n
Timeout is set to 5 seconds. Connection check may fail on slow connections.'

if [ "$status" != "302" ]; then
    errexit "$statusfail"
fi

# Check origin is correct
origin=`git config remote.origin.url`
originfail='ERROR: Origin is incorrect.
Should be git@github.rackspace.com:rpc-internal/docs-rpc.git.\n
Are you in the correct repository?'

if [ "$origin" != "git@github.rackspace.com:rpc-internal/docs-rpc.git" ]; then
    errexit "$originfail"
fi

# Check upstream is correct
upstream=`git config remote.upstream.url`
upstreamfail='ERROR: Upstream is incorrect.
Should be git@github.com:rackerlabs/docs-rpc.git.\n
Are you in the correct repository?'

if [ "$upstream" != "git@github.com:rackerlabs/docs-rpc.git" ]; then
    errexit "$upstreamfail"
fi

# set current directory
STARTDIR=`pwd`

# set repo root directory
GITDIR=`git rev-parse --show-toplevel`

# set source directories and files
FILES='.gitignore .nojekyll'
SOURCE='internal common figures'

V13SOURCE='internal/rpc-v13-faq-internal internal/rpc-v13-install
internal/rpc-v13-ops-internal internal/rpc-v13-sales-eng'

V12SOURCE='internal/rpc-v12-faq-internal internal/rpc-v12-install
internal/rpc-v12-ops-internal internal/rpc-v12-sales-eng'

V11SOURCE='internal/rpc-v11-faq-internal internal/rpc-v11-install
internal/rpc-v11-ops-internal internal/rpc-v11-releasenotes-internal-supp'

V10SOURCE='internal/rpc-v10-faq-internal internal/rpc-v10-installation
internal/rpc-v10-releasenotes-internal-supp'

# set branches to build
BRANCHES=(master v10 v11 v12 v13)

# ensure branches are up-to-date
cd $GITDIR

for branch in ${BRANCHES[@]}; do
    git checkout $branch
    git fetch upstream
    git merge upstream/$branch
    git push origin $branch
done

# checkout gh-pages branch and delete contents except . files
git checkout gh-pages
currentbranch=`git rev-parse --abbrev-ref HEAD`
ghbranchfail='ERROR: No gh-pages branch.\nAre you in the correct repository?'

if test "$currentbranch" = "gh-pages"; then
    find * -not -name ".*" -delete
else
    errexit "$ghbranchfail"
fi

# checkout source directories and reset HEAD
git checkout master $SOURCE $FILES
git checkout v13 $V13SOURCE
git checkout v12 $V12SOURCE
git checkout v11 $V11SOURCE
git checkout v10 $V10SOURCE
git reset HEAD

# build html from rst in internal directory
cd internal
if ! make internalhtml; then
    cd $GITDIR
    git add . && git reset --hard origin/gh-pages -- && git checkout master
    errexit "Sphinx build failure. gh-pages branch reset to previous commit."
fi

# move html files to root directory
mv -fv _build/html/* $GITDIR/

# remove source files
cd $GITDIR
rm -rf $SOURCE

# add, commit, and push new html files
git add .
git commit -m "gh-pages: `git log master -1 --pretty=short --abbrev-commit`"
git push -f origin gh-pages

# checkout master and signal completion
git checkout master
cd $STARTDIR
echo
if test `tput -T $TERM colors` -lt 256; then
    echo "Published: https://pages.github.rackspace.com/rpc-internal/docs-rpc"
else
    tput -T $TERM setaf 2
    echo "Published: https://pages.github.rackspace.com/rpc-internal/docs-rpc"
    tput -T $TERM sgr0
fi
exit 0
