### EVER BASH
You can save all your bash commands and retrieve

### Keywords
- Help: save -h
- Save using: save <command>
- Copy using: save -s <match>


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
