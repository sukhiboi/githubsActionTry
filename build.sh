#cloning frontend
git clone https://github.com/sukhiboi/blog-frontend.git frontend 1> /dev/null 2> /dev/null;

#creating react build
echo "Building frontend";
cd frontend;
npm install 1> /dev/null 2> /dev/null;
npm test 2> /dev/null;
npm run build 2> /dev/null;

#cloning build to root
mv build ../build;
cd ..;

#cloning backend
echo "Building backend";
git clone https://github.com/sukhiboi/blog-backend.git backend 1> /dev/null 2> /dev/null;

cd backend;
npm install 1> /dev/null 2> /dev/null;
npm test;
rm -rf node_modules;

#cloning backend to root
echo "Bundling server code and react build"
cp -R ./* ..;
cd ..;

#deleting backend
echo 'Cleaning';
rm -rf node_modules;
rm -rf backend;
rm -rf frontend;

ls -al; 
git remote add heroku https://heroku:${{secret.HEROKU_API_KEY}}@git.heroku.com/githubactions.git
rm -rf coverage scripts;
git add .;
git commit -m "new commit"
git config --global user.email "41sukhdevaingh@gmail.com"
git config --global user.name "sukhiboi"
git push heroku master --set-upstream;