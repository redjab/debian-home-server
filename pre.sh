name = $1
email = $2

#Git
git config --global user.name $name
git config --global user.email $email

# SSH key for GitHub
ssh-keygen -t rsa -b 4096 -C $email

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub

# Copy to GitHub

# Start Git
cd git
git init
git remote add origin https://github.com/redjab/debian-home-server.git
git remote add origin git@github.com:redjab/debian-home-server.git
git branch --set-upstream-to=origin/master master
git pull