# aion-fastvm-docker
Docker container for Aion FastVM / Solidity compiler. Use this to quickly compile your Solidity `.sol` smart contracts for the Aion Network

## Prerequisites

Docker v18.09 and above

## Installation

1. Make sure you have Docker installed:

```bash
$ docker --version
> Docker version 18.09.0, build 4d60db4
```

2. Pull in the latest images:

```bash
$ docker pull satran004/aion-fastvm:0.3.2
> 0.3.2: Pulling from satran004/aion-fastvm
> 7b8b6451c85f: Pull complete 
> ab4d1096d9ba: Pull complete 

...
> Status: Downloaded newer image for satran004/aion-fastvm:0.3.2
```

3. If you're running Linux or macOS, add a `solc` alias to your `~/.bashrc` file (you don't need to do this step if you're on Windows):

```bash
$ cat << \EOF >> ~/.bashrc
$ # Aion FastVM Docker Solc Alias
$ alias solc='docker run --rm -v "$(pwd):/project" satran004/aion-fastvm:0.3.2 solc' 
$ EOF
$ source ~/.bashrc
```

4. Reload your `.bashrc` file.

```bash
$ source ~/.bashrc
```

5. Clone this repo and compile the sample `.sol` smart contract:

```bash
$ git clone https://github.com/satran004/aion-fastvm-docker.git
$ cd aion-fastvm-docker/sample
$ solc --abi --bin -o . Math.sol
```

6 You should now have `Math.sol`, `Math.abi`, and `Math.bin` in the `aion-fastvm-docker/sample` folder:

```bash
$ ls
> Math.abi Math.bin Math.sol
```

## Usage

To compile a `.sol` file, go to the solidity source folder and run: `solc --abi --bin -o .  <source_file>.sol`
