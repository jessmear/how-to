##Getting a Create-React-App Onto GitHub Pages

npm install gh-pages --save-dev

Edit the package.json:
  "homepage": "http://{githubusername}.github.io/{nameofrepo}"
  in scripts:
    "predeploy": "npm run build",
    "deploy": "gh-pages -d build"
  
npm run deploy

commit and push

set up gh-pages on the repo
