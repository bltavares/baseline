Version 1.2.0

* Add `baseline status`

Version 1.1.4

* Fix the `baseline up` command. Vagrant changed the default behaviour, now machines don't reprovision again on every up, but this is a behaviour that I would like to keep, specially because you can reprovision machines with different environments

Version 1.1.3

* Fix the warning `[[: not found` for `baseline root-dir`

Version 1.1.2

* Update the `provision` command to match the latest changes on vagrant
* Add the option to include the branch you want to clone the vagrant-baseline repo

Version 1.1.1

* List the environments of the baseline project in the provision command

Version 1.1.0

* List the environments of the baseline project with autocomplete
* Commands that require to be run inside a baseline project will stop with a informative message
* Include .baseline on .gitignore on init


Version 1.0.0

* Basic functonality to bring up a vagrant box
* Possiblity to use your own fork of vagrant-baseline
* Possibility to set your own dotfiles repo
