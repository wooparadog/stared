#! /bin/bash
#
# clone_all_repos.sh

for i in `cat repos`;do
    target_dir=`echo $i | sed -e 's/^.*\/\(.*\).git/\1/g'`
    if [ -d $target_dir ];then
        cd $target_dir
        git pull origin master
        cd ..
    else
        git submodule add $i $target_dir
    fi
done
