# git-guide

## Guide for useful git commands and general basic usage

### Repo management

`gh clone repo user/repo_name` - download repo locally with git configuration

### Managing file changes

`git add filename` - stage file(s) for a commit (*use . to denote all files in the directory*)

`git restore --staged filename` - unstage file(s) for a commit

`git-status` - list status of staged files and some brief information such as if the file has been modified or is a new file etc.

`git commit -m " "` - commit staged git files with a message containing a descriptor of the nature of the commit (*e.g. "fixed a markdown header"*)]

`git push` - push local commits to the online repository stored on github

### Viewing logs

`git log` - view a log of commits with commit ID, author, date and attached message

`git log --oneline` - view a log of commits in a shorthand format (*this purely displays a shortened ID and the associated message*)

### Undoing things

`git checkout commitID` - **SAFE** - show code at that point in time to view the state of a file at that given point (*this detaches from the master branch)

`git checkout master` - return to master branch after using checkout to visit an old file state at a previous commit

`git revert commitID` - **SOMEWHAT SAFE** - undo the commit as if it never existed. A prompt will appear showing changed to be committed. A seperate commit is created that reverts the given commit, whilst the old commit is still accessible

`git reset commitID` - **UNSAFE** - resets repository to the state at a given commit (*later commits are deleted entirely*). The edited files will remain accessible in the editor as a final means to re-commit any changes that should be kept

`git reset commitID --hard` - **EXTREMELY UNSAFE** - remove commit entirely, edited files are not temporarily available in the editor meaning there is *no going back*
