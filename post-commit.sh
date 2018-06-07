#!/bin/bash -ue

echo "In git post-commit you are."

gitdir="$(git rev-parse --git-dir)"
username=`git config user.name`
echo "git dir is: $gitdir"

hook="$gitdir/hooks/post-commit"

last_commit_msg=`git log -1 HEAD`

echo "original commit msg: $last_commit_msg"

version=`cat version.info | grep pl-PL | cut -f2`

echo "version was: $version"

new_version=`echo -e "$version" | awk -F"." '{ print $1 FS $2 + 1 FS $3 }'`

echo "new version is: $new_version"

#echo "HEAD: $HEAD lcm: $last_commit_msg"

[ -x $hook ] && chmod -x $hook

git commit --amend --no-verify -m"[pl-PL] Lang, version $new_version commited by $username"

chmod +x $hook

exit 1
