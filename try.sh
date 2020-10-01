ls -al; 
git remote add heroku https://git.heroku.com/githubactions.git;
rm -rf coverage scripts;
git add .;
git commit -m "new commit"
git push heroku master --set-upstream;