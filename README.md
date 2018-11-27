# aion-fastvm-docker
Docker container for Aion FastVM / Solidity compiler.

## Usage:

> docker pull satran004/aion-fastvm:0.3.2

> alias solc='docker run --rm -v "$(pwd):/project" satran004/aion-fastvm:0.3.2 solc'        //only in Mac OS and Linux


## To compile, go to the solidity source folder

> solc --abi --bin -o .  <source_file>.sol 
