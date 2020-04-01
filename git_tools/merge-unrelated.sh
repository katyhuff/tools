# source: http://st-on-it.blogspot.com/2010/01/how-to-move-folders-between-git.html
# First of all you need to have a clean clone of the source repository so we didn't screw the things up.

git clone git@github.com:arfc/2018-rykl-bwsymposium

# After that you need to do some preparations on the source repository, nuking all the entries except the folder you need to move. Use the following command

git filter-branch --subdirectory-filter your_dir -- -- all

# This will nuke all the other entries and their history, creating a clean git repository that contains only data and history from the directory you need. If you need to move several folders, you have to collect them in a single directory using the git mv command.

# You also might need to move all your content into some directory so it didn't conflict with the new repository when you merge it. Use commands like that

mkdir new_directory/
git mv my_stuff new_directory/

# Once you've done commit your changes, but don't push!

git commit -m "Collected the data I need to move"

# This is all about the source repository preparations.
# Now go to your destination repository

cd ../my-repo2/

# And here is the trick. You need to connect your source repository as a remote using a local reference.

git remote add repo1 ../my-repo1/

# After that simply fetch the remote source, create a branch and merge it with the destination repository in usual way

git fetch repo1
git branch repo1 remotes/repo1/master

git merge repo1 --allow-unrelated-histories

# This is pretty much it, all your code and history were moved from one repository to another. All you need is to clean up a bit and push the changes to the server

git remote rm repo1
git branch -d repo1

git push origin master

# That's all. After that you can nuke the temporary source repository.
