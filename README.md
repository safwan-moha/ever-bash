### EVER BASH
- You can save all your bash commands easily.
- Very easily retrieve saved commands
- No need of a text editor to save your codes anymore.


### Installation
for linux

`wget -N https://raw.githubusercontent.com/safwan-moha/ever-bash/master/install.sh && bash ./install.sh`

for OSx

`soon...`


### Keywords
- Help: `save -h`

- Save using: `save`
will save the last command
- Save using: `save <command>`
will save the specified command

- Copy using: `save -s <match>`
- Delete using: `save -d <match>`


### Usage - Saving
- Type `save sudo service apache2 restart`
This is going to save `sudo service apache2 restart`
- It will promt you for a save-name
`save-name: restart apache`

![Saving a command](https://raw.githubusercontent.com/safwan-moha/ever-bash/master/docs/save.gif)




### Usage - Retreiving/searching
- Type `save -s restart`
This is going to search for tags with `restart`
- You will get the list of items that matches the text
- It will promt which line to copy: `copy line: 3`
- This command will be copied to your clipboard

![Searching a command](https://raw.githubusercontent.com/safwan-moha/ever-bash/master/docs/search.gif)
