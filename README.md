# dotfiles
My Dotfiles

# Vim plugin management

## Adding a package

Here is an example of how to add a package using Vim’s native approach to packages and git submodules.

> cd ~/dotfiles
> git submodule init
> git submodule add https://github.com/vim-airline/vim-airline.git vim/pack/shapeshed/start/vim-airline
> git add .gitmodules vim/pack/shapeshed/start/vim-airline
> git commit

## Updating packages

To update packages is also just a case of updating git submodules.

> git submodule update --remote --merge
> git commit

# Removing a package

Removing a package is just a case of removing the git submodule.

> git submodule deinit vim/pack/shapeshed/start/vim-airline
> git rm vim/pack/shapeshed/start/vim-airline
> rm -Rf .git/modules/vim/pack/shapeshed/start/vim-airline
> git commit

**Table of Contents**

<!-- toc -->

- [About](#about)
  * [Installing](#installing)
  * [Customizing](#customizing)
- [Resources](#resources)
  * [`.vim`](#vim)
- [Contributing](#contributing)
  * [Running the tests](#running-the-tests)

<!-- tocstop -->

## About

### Installing

```console
$ make
```

This will create symlinks from this repo to your home folder.

### Customizing

Save env vars, etc in a `.extra` file, that looks something like
this:

```bash
###
### Git credentials
###

GIT_AUTHOR_NAME="Your Name"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="email@you.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
GH_USER="nickname"
git config --global github.user "$GH_USER"

###
### Gmail credentials for mutt
###
export GMAIL=email@you.com
export GMAIL_NAME="Your Name"
export GMAIL_FROM=from-email@you.com
```

## Resources

### `.vim`

For my `.vimrc` and `.vim` dotfiles see
[github.com/jessfraz/.vim](https://github.com/jessfraz/.vim).

## Contributing

### Running the tests

The tests use [shellcheck](https://github.com/koalaman/shellcheck). You don't
need to install anything. They run in a container.

```console
$ make test
```
