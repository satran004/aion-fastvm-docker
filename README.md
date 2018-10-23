# aion-fastvm-docker
Docker container for Aion FastVM / Solidity compiler.

## Usage:

> docker pull satran004/aion-fastvm:0.3.1

> alias solc='docker run --rm -v "$(pwd):/src" satran004/aion-fastvm:0.3.1 solc'        //only in Mac OS and Linux


## To compile, go to the solidity source folder

> solc --abi --bin -o .  <source_file>.sol 
