# ubuntu setup

## installation

Most scripts can be run independently of each other, the only exception being `config.sh` which depends on packages like `git` or `python3-pip`.
As a result of that `config.sh` should always be run last.

The remaining three scripts can be run in parallel.

*NOTE: `flatpaks.sh` runs 2 apt commands and requires apt package lock. Consequently `flatpaks.sh` should be started before `apts.sh` if you don't want to wait for `apts.sh` to finish first*
