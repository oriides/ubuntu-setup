# ubuntu setup

## installation

Most scripts can be run independently of each other, the only exception being `config.sh` which depends on packages like `git` or `zsh`.
As a result of that `config.sh` should always be run last.

The remaining scripts can be run in parallel.

*NOTE: `flatpaks.sh` runs 2 apt commands and requires apt package lock. Consequently `flatpaks.sh` should be started before `apts.sh` if you don't want to wait for `apts.sh` to finish first*

*NOTE: `config.sh` requires GitHub access through git by means of a functioning ssh key*

*NOTE: is may be required to run Evolution Mail at least once to generate the config files, where the `config.sh` script needs to place the filters.xml file.*  
*However it is also possible to manually copy the filters.xml into `~/.config/evolution/mail/filters.xml`*

## TODOs

Fix Icon locations for .desktop Files