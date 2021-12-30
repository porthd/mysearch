(I trust in googles translations)
# mysearch - a personal search index for surfing history
## Foreword
The project is under development. If something doesn't work, please don't hesitate to publish it in the issue on Github for this project porthd / mysearch
The project wants to give everyone the opportunity to save their personal surfing history in a private search index. It is openly designed so that you can replace the existing TYPO3 extensions with your own. The add-on is also just a prototype.
If you have suggestions for improvement, better extensions, better add-ons, add-ons for other browsers, I am happy to hear from you.

##Requirements
1. Open Console / Bash / PcShell / Terminal / Cmd or similar command line interpreter and go to `cd path / To the target folder`, where the project should be created in the subfolder` mysearch`.
2. Download only Git and install it across the computer (computer-wide)
   https://git-scm.com/downloads
3. Install Docker-desktop on the computer (computer-wide)
1. Find the correct operating system
2. Follow instructions from ddev: https://ddev.readthedocs.io/en/stable/users/docker_installation/ (Engl.)
3. If necessary also https://www.docker.com/products/docker-desktop (Engl.)
4. Install ddev (computer-wide)
   (English Important notes https://ddev.readthedocs.io/en/stable/)
   Install ggls on Windows with Chololaty (choco)
   Homebrew works fine on Linux
   Homebrew should work on Mac too.
5. Download the zip file of the project `porthd / mysearch` from GitHub and unzip it in a self-created folder` mysearch`.
   Or enter the following in the command line (git unpacks for you):
   `git clone https: // github.com / porthd / mysearch.git`

## Prepare first indexings with Firefox / Browser
1. Check in the command line interpreter whether mysearch is running under ddev.
   Just type in `ddev list`. The entry in the table must be mysearch ok
2. Open Firefox as a browser.
3. Install the add-on by searching for MySearch or by clicking the gear on the `about: addons` page and installing the add-on as a file. The zip file is in the project in AddOn / Firefox / mysearchAddOn.zip
4. Bring the icon with the eye into your toolbar. You can use the pop-up to determine the index and switch the indexing of pages you have visited on and off.

** Note: ** In principle, the browser could also function as a search robot. So far I have refrained from building corresponding functions, as there are various aspects to consider here. I think in such cases robots.txt or copy restrictions should be observed.

** Note: ** The add-on is currently not yet registered with FireFox. You only can


## First start your local search engine
1. Go in the command line interpreter with `cd path / To the target folder` into the folder` mysearch`, which was created when the zip file was unzipped
2. Command line interpreter: start ddev with
   ddev start
   (There should be enough hard disk space, as ddev reloads many programs / images. In this way, despite the quirks of Windows, MacOs or Linux, etc.) you can create a uniform system environment.)
3. Command line interpreter: After starting ddev, enter the following commands
   `ddev exec. / firstInstall.sh`
   Among other things, it creates the file `mycomposer.json` in which you can make your own changes to extension assignments.
4. Command-Line-Interpreter: In order for TYPO3 to work, it needs a database. The project brings a data initial. You just have to import them.
   `ddev import-db --src=initial-mysearch.sql`
5. Command line interpreter: Then the TYPO3 system has to be installed
   `ddev composer update`
6. Command line interpreter: The initial database must then be installed. This contains the TYPO3 configurations and makes the website `https: // mysearch.ddev.site` available locally on your computer.
7. Command line interpreter: Then restart the ddev system
   `ddev restart`
8. Browser:
   Surf to: `https: // mysearch.ddev.site`
9. Create a search query, if anything has already been indexed. (FireFox addon)
   Note: If your search index is empty, you could get an error message - perhaps an ugly one - error message.

## More starts of your local search engine
Notice. No browsing history will be indexed without the Ddev running. (Recognizable by the reddish frame.)
A page has only been indexed if the frame around the page is green. Black means that the page is on the bläcklist. Blue means that the add-on is currently not supposed to index. Yellow means the page is in progress.
1. Go in the command line interpreter with `cd path / to the target folder` into the folder` mysearch`, which was created when the zip file was unzipped for the first time
2. If you have made changes to your mycomposer.json file, then execute the following commands:
1. `ddev exec. / UpdateInstall.sh`
2. `ddev composer update`
3. Command line interpreter: start ddev with
   `ddev restart`
   (This has the advantage that a running version is shut down and ddev is restarted.
4. Browser: For your own search
   Surf to: `https: // mysearch.ddev.site`


## Further developments of the prototype
A central idea would be that you can buy link collections on certain topics, which the search index then indexes. This would offer an interesting additional income for journalists or hobby internet users.
You can expand the TYPO3 system with your own extensions in order to provide the system with additional indexers or results.
You can also replace my extension with your own extensions. (It would go too far to explain this in detail.)
Since the TYPO3 only acts as an interface between the ElasticSearch database and your browser, you can establish your own CMS system on the ddev system.
You can of course also write your own add-on for Firefox. Or also for other browsers. For example, you could use an add-on to monitor certain (cinemas, concerts, theaters, ...) pages. Or an add-on monitored prices on different pages.


### security concerns
You can also run this system on an Internet server. In this case you should provide password protection for the ElasticSearch server and the server as a whole.
In terms of security, the present prototype is a disaster.
So far, I have not really understood how to secure Elasticsearch with passwords. As long as you only use the site locally on your computer and you are not connected to any (company) network, there should be no problems.
I am open to suggestions for optimizing security.