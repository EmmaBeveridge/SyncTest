#!/usr/bin/env bash
commit_message=''
pull_to_dir=''

echo
print_usage() {
  printf "Usage: ..."
}

while getopts 'm:d:' flag; do
  case "${flag}" in
    m) commit_message="${OPTARG}" ;;
    d) pull_to_dir="${OPTARG}" ;;
    *) print_usage
       exit 1 ;;
  esac
done
echo "Commit message $commit_message"
git add .
git commit -m "$commit_message"
git push -u origin main #Assumes pushing to main branch of existing remote called origin
ssh eb379@eb379.teaching.cs.st-andrews.ac.uk "echo "in ssh" && cd $pull_to_dir && git pull && echo "pulled""