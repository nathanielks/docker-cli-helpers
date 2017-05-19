# Docker CLI Helpers

An opinionated set of context-aware shorthand scripts for interacting with Docker more easily.

## Installation
1. Clone this repository somewhere on your machine
1. Add `bin/` to your path in your `~/.bashrc`, `~/.zshrc`, etc
```
PATH=$PATH:/path/to/docker-cli-helpers/bin
```

## Usage

- `db` for building
- `dr` for running
- `de` for executing
- `drm` for deleting a container
- `drmi` for deleting an image

Sane defaults are provided so you don't need to do anything:

- `NAME`: defaults to the name of the current directory
- `VERSION`: default to the current git branch

If a `.dockerinfo` file exists in the current directory, it will be sourced and used for the name and version of the docker container being built/run. For example:

```
#.dockerinfo
NAME=some-docker-container
```

### Examples:

Where the name of the directory we're currently is `nginx-app`, the current git branch is `http-2.0`, and the current git commit is `f2393ad`:

```
$ db
# builds an image named nginx-app:http-2.0

$ dr
# runs a container as a daemon named nginx-app-f2393ad off the nginx-app:http-2.0 image

$ de
# runs bash in the nginx-app-f2393ad container

$ drm
# force stops and deletes the nginx-app-f2393ad container

$ drmi
# deletes the image named nginx-app:http-2.0
```

You're also able to pass `NAME` or `NAME:VERSION` to the scripts in case you don't like the defaults:

```
$ db super-app
# builds an image named super-app:http-2.0

$ db super-app:latest
# builds an image named super-app:latest
```

Note: `db` was used for this example, but all the scripts take these parameters.

### Notes:

I'm still not 💯 on the naming convention, but it's on my mind and I'll work on it over time. PR's welcome!
