# Baseline
## Dev box with batteries

The idea is to provide a simple dev box with tools.

Sometimes you want to play with a project, which leads you to install a lot of stuff on your computer and the filesystem gets messy.
Your computer turn out to be slow booting up, because it is loading a database that you never use.
Maybe you want to try out a language but it requires you to install all the libraries and compilers.

Now you can mess up all the files in your dev box, and discard when you think it is to messy.

### Table of contents
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Commands](#commands)
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
git clone https://github.com/bltavares/baseline.git /opt/baseline
echo 'export PATH=$PATH:/opt/baseline/bin' >> $HOME/.bashrc
echo 'eval "$(baseline autocomplete)"' >> $HOME/.bashrc
```

### Commands

#### init - Create a new box in the project dir

```bash
baseline init <path to init box>
```

#### up - Bring a box up with some configuration

```bash
baseline up <environments>
```

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

### Using GUI programs

Ssh allows you to forward the X server to your computer. If you want to use a program with a grafical interface or want to code an app that generates graphics, you can ask `vagrant` to forward it for you.

Just goes with:
```bash
baseline ssh -- -X
```

### Extending with your own puppet scripts

Sometimes you will want to try out some different modules that are not currently in the project, or will want to set up a webserver for the project you are writing and have it configured and deployed with your project.
Or maybe you just want to have some packages installed, or removed.

You can achieve that extending the project using the _.baseline/puppet/custom_ folder. There is an example file to guide you in the path to extend your vagrant machine.

### Debugging

When building puppet scripts, a verbose output can help. In those cases we provide the `DEBUG` variable to increase the output, show debug messages and create dependency graphs

```bash
DEBUG=1 baseline up redis
```

