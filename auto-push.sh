#! /bin/bash

# commit user info
USER_NAME=loftkun
USER_EMAIL=loftkun@gmail.com

# repository root path
DIR=/Users/shikai/Documents/study/conference

# target dir or file path
#TARGETS=2018/1208-osc
TARGETS=.

# interval[sec]
INTERVAL=30

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
    #git commit -m "${MESSAGE}" --amend
    #git commit -m "${MESSAGE}" --amend --date="$(env LANG=C date)"
    git -c user.name=${USER_NAME} -c user.email=${USER_EMAIL} commit -m "${MESSAGE}" --amend --date="$(env LANG=C date)"
    git push -f origin
}

cd ${DIR}

while true;
do
    push
    sleep ${INTERVAL}
done

