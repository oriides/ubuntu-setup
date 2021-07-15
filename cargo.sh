#!/bin/bash

# installs rust-lang
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

source $HOME/.cargo/env

cargo install https
cargo install tokei
cargo install bottom