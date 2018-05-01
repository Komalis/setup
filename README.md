# Dotfiles

### UNIX
For a better diplaying of airline: `sudo apt-get install fonts-powerline`


### Windows
For a better diplaying of airline :

1. `Download font https://github.com/powerline/fonts`
2. `Launch Windows PowerShell as administrator`
3. `cd ${HOME}\Downloads\fonts-master\fonts-master`
4. `Set-ExecutionPolicy Bypass`
5. `.\install.ps1`
6. `Select new installed font`

### SSH
1. If necessary, generate a new ssh key (public/private)
`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`
2. Generate ssh config file
`touch ~/.ssh/config`
3. Add host config
```
Host github.com
        User git
        Hostname github.com
        PreferredAuthentications publickey
        IdentityFile ~/.ssh/id_rsa_home
```
