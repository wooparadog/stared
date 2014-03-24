#! /bin/bash
#
# clone_all_repos.sh

flag=$1

for i in `cat repos`;do
    target_dir=`echo $i | sed -e 's/^.*\/\(.*\).git/\1/g'`
    if [ -d $target_dir ];then
        if [ "update" = "$flag" ]; then
            echo Updating, $i
            cd $target_dir
            git pull origin master
            cd ..
        fi
    else
        echo git submodule add $i $target_dir
        git submodule add $i $target_dir
    fi
done
