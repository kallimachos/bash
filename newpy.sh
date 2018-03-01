#!/bin/bash

# Initializes a new git repository for a python project.

abort() {
    printf "\033[31mError: $@\033[0m\n" && exit 1
}

display_help() {
    cat <<-help

    Usage: newpy [options]

    Commands:

        newpy           Start interactive Python repository creator

    Options:

        -h, --help      Display help information

help
    exit 0
}

repo_name() {
    dir_name=`basename $(pwd)`

    echo -n "Repo name (hit enter to use current directory)? "
    read repo_name

    if [ "$repo_name" = "" ]; then
        repo_dir=$(pwd)
    else
        mkdir -p $repo_name
        cd $repo_name
        repo_dir=$(pwd)
    fi
}

git_config() {
    username=`git config github.username`
    if [ "$username" = "" ]; then
        abort "Username not found. \
Run 'git config --global github.username <username>'"
    fi

    token=`git config github.token`
    if [ "$token" = "" ]; then
        abort "Token not found. Run 'git config --global github.token <token>'"
    fi
}

template() {
    echo -n "Use python project template? (y/n) "
    read template
    if [ "$template" = "y" ]; then
        template=~/code/python/template
        cd $template && git clean -xfd
        rsync -a --exclude='MANIFEST' --exclude='.git/' ./ $repo_dir
        cd $repo_dir
        sed -i "" "s/template/$repo_name/g" README.rst setup.py tox.ini \
        template/__init__.py template/template.py tests/test.py \
        tools/deploy.sh doc/index.rst doc/conf.py
        mv template/template.py template/$repo_name.py
        mv template $repo_name
    else
        echo "No template selected."
        echo "$repo_name" > README.rst
    fi
}

create_repo() {
    echo -n "Initialising local repository ..."
    git init > /dev/null 2>&1
    git config --local user.name kallimachos
    git add .
    git commit -q -a -m "Initial commit"
    echo " done."

    echo -n "Creating Github repository '$repo_name' ..."
    curl -u "$username:$token" https://api.github.com/user/repos -d \
    '{"name":"'$repo_name'"}' > /dev/null 2>&1
    echo " done."

    echo -n "Pushing local code to remote ..."
    git remote add origin git@github.com:$username/$repo_name.git \
    > /dev/null 2>&1
    git push -u origin master > /dev/null 2>&1
    echo " done."
}

create_ghpage() {
    echo -n "Create gh-page? (y/n) "
    read ghpage
    if [ "$ghpage" = "y" ]; then
        git checkout --orphan gh-pages
        git rm -rf .
        touch .nojekyll
        echo $repo_name > index.html
        git add .
        git commit -a -m "First pages commit"
        git push -u origin gh-pages > /dev/null 2>&1
        echo "gh-page available at http://kallimachos.github.io/$repo_name."
        git checkout master
    else
        echo "No gh-page created."
    fi
}

# Handle arguments

if test $# -gt 0; then
    display_help
else
    repo_name
    git_config
    template
    create_repo
    create_ghpage
    echo "Please update README.rst, setup.py, and enable linkcheck and Travis \
builds if required."
fi
