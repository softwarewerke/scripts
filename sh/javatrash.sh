#!/bin/sh
# if not exists, creates a hidden project folder in the home directory
# and creates a basic Java project
# creates a new branch
# open vscode 

D=~/.javatrash
G=com.example
P=trash

main() {

[ ! -d $D ] && { createTrashProject $D $G $P; }

cd $D/$P

git checkout -- .
git checkout master
git checkout -b $(date +%a%m%d%H%M)

code --new-window .
}

createTrashProject() {
mkdir $1
cd $1
mvn --batch-mode archetype:generate -DarchetypeGroupId=com.dominikcebula.archetypes \
                       -DarchetypeArtifactId=java17-basic-archetype \
                       -DarchetypeVersion=1.1 \
                       -DgroupId=$2 \
                       -DartifactId=$3 \
                       -Dversion=1.0-SNAPSHOT
cd $3
cat >.gitignore <<EOF
/target/
EOF
git init
git add .
git commit -m first
mvn install
}

main

