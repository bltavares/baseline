# Baseline
## Dev box with batteries

The idea is to provide a simple dev box with tools.

Sometimes you want to play with a project, which leads you to install a lot of stuff on your computer and the filesystem gets messy.
Booting your computer begins to slow, because it is loading a database that you never use.
Maybe you want to try out a language but it requires you to install all the libraries and compilers.

Now you can mess up all the files in your dev box, and discard when you think it is too messy.


#### Video cast
_Click to watch a live example of baseline_

[![Video Cast](http://i.imgur.com/DKy7Huj.png)](http://showterm.io/ff5b0a53bdc8a70d7d5b8)

### Table of contents
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Commands](#commands)
  - [List of environments](#list-of-environments)
  - [Using GUI programs](#using-gui-programs)
  - [Extending with your own puppet scripts](#extending-with-your-own-puppet-scripts)
  - [Debugging](#debugging)

### Requirements

* [Vagrant](http://vagrantup.com)
* Internet connection
* git

### Installation
Make sure you have vagrant installed and configured on your machine.

```bash
# Adjust the paths to your preferred location
installation_path=/opt/baseline
shell_configuration=$HOME/.bashrc

git clone https://github.com/bltavares/baseline.git $installation_path
echo 'export PATH=$PATH:'$installation_path'/bin' >> $shell_configuration
echo 'eval "$(baseline autocomplete)"' >> $shell_configuration
```
This command will clone this repo to /opt/baseline by default and add it to your PATH, so the command can be found.
Then it will add some autocomplete for you.

Don't worry too much about cloning it into /opt/baseline. Clone it wherever you want, but put that onto your path. One idea is to clone it somewhere, then symlink it to a place on your path.

### Commands

#### init - Create a new box in the project dir

```bash
baseline init [<path where you want your box to live. default to '.'> [<git url for the vagrant files. default to https://github.com/bltavares/vagrant-baseline.git> [branch name. default to "master"]]] 

# example
cd awesome-project
baseline init .

# another example
baseline init awesome-project https://github.com/<your-username>/vagrant-baseline.git awesome-code
cd awesome-project
```

#### up - Bring a box up with some configuration

```bash
baseline up [<environments>]
```
- Arguments:
  - environments: optional list of enviroments to start the box with. If no argument is passed, it will come up with the last configuration used.

e.g.:
```bash
baseline up ruby nodejs
```

#### ssh - Connect to the box
```bash
baseline ssh
```

#### provision - Provision a running box with the specified environments
```bash
baseline provision <environments>
```

#### down - Shutdown the box
```bash
baseline down
```

#### destroy - Destroy the box
```bash
baseline destroy
```

#### update - Update the box recipes
```bash
baseline update
```

#### dotfiles
```bash
baseline dotfiles <gir url for the dotfiles> 
```
- Arguments:
 - git url for the dotfiles: The url to clone dotfiles from

This command will change the configurations to point to your own dotfiles.
Then use the environment `dots` to have it installed in your box.

Eg:
```bash
baseline init
baseline dotfiles <github clone url>
baseline up dots nodejs
```

The dofiles project must have some constraints. Check the [instructions](https://github.com/bltavares/vagrant-baseline#using-your-own-dotfiles).

#### upgrade
```bash
baseline upgrade
```
Upgrade baseline to the latest version

#### envs
```bash
baseline envs
```
List the environments supported by the current baseline project


#### version
```bash
baseline version
```

### List of environments

Currently baseline is only supporting [vagrant-baseline](https://github.com/bltavares/vagrant-baseline) vagrant setup.
You can check the list of supported environments [here](https://github.com/bltavares/vagrant-baseline#current-environments).

### Using GUI programs

Ssh allows you to forward the X server to your computer. If you want to use a program with a graphical interface or want to code an app that generates graphics, you can ask `vagrant` to forward it for you.

Just ssh with the following command:
```bash
baseline ssh -- -X
```

### Extending with your own puppet scripts

Sometimes you will want to try out some different modules that are not currently in the project. Perhaps you want to set up a webserver for the project you are writing and have it configured and deployed with your project. Or maybe you just want to have some packages installed, or removed.

You can achieve that by extending the project using the _.baseline/puppet/custom_ folder. There is an example file to guide you in extending your vagrant machine.

### Debugging

When building puppet scripts, a verbose output can help. In those cases we provide the `DEBUG` variable to increase the output, show debug messages and create dependency graphs.

```bash
DEBUG=1 baseline up redis
```

