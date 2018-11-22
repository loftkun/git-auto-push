#! /bin/bash

# repository root path
DIR=/Users/loft/Documents/conference/

# target dir or file path
TARGETS=2018/1122-Geeks-Who-Drink

# interval[sec]
INTERVAL=60

# message
MESSAGE="auto commit"

# git add, commit, push
push () {
    regex="^.*nothing to commit"
    if [[ "$(git status)" =~ ${regex} ]]; then
        return
    fi
    git add ${TARGETS}
    #git commit -m "${MESSAGE}"
    git commit -m "${MESSAGE}" --amend
    git push -f origin
}

cd ${DIR}

while true;
do
    push
    sleep ${INTERVAL}
done

