#!/bin/bash


BRANCH=$1

if [ "$BRANCH" == "" ]; then
    BRANCH="origin\/rc[[:digit:]]+"
fi


for br in $(git br -r | egrep "$BRANCH"); do
    behindby=`git log --oneline --no-merges $br..origin/master | wc -l`
    if [ "$behindby" -gt "1000" ]
    then
        # find last author
        last_author="`git log -1 --format=\"format:%ae\" $br`"
        echo "$br is behind by $behindby: $last_author"

        # delete
        # echo "deleting $br"
        # refspec="`echo $br | sed s/^origin\\\///`"
        #echo "git push origin :$refspec"
        #"`git push origin :$refspec`"

    #else
        #last_author="`git log -1 --format=\"format:%ae\" $br`"
        #echo "$br is behind by $behindby: $last_author"
    fi
    #echo "$br: `git log --oneline --no-merges $br..HEAD | wc -l`"
done

