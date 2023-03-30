# Set up git server

## Clients
Generate pub/priv key pairs on each computer wanting to access the repository
`ssh-keygen -o`

https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Server
```
sudo adduser git
su git
cd
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys
```

`cat /tmp/id_rsa.john.pub >> ~/.ssh/authorized_keys`

```
cd /srv/git
mkdir project.git
cd project.git
git init --bare
Initialized empty Git repository in /srv/git/project.git/
```

## Initialize

Set up project from John's computer

```
# on John's computer
cd myproject
git init
git add .
git commit -m 'Initial commit'
git remote add origin git@gitserver:/srv/git/project.git
git push origin master

git remote set-url origin [link] // If typo and you need to rename
```

Anyone else can get to work

```
$ git clone git@gitserver:/srv/git/project.git
$ cd project
$ git commit -am 'Fix for README file'
$ git push origin master
```

git remote set-url origin dan@dans-git.lan:/git/