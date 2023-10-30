# <h1 align="center"> Catapulta.sh Forge Template </h1>

Template repository for getting started quickly with Deploying Your Contracts to your Private Testnet with [Catapulta.sh](https://catapulta.sh/docs) Chain Ops Suite for Foundry projects.

This repository contains the foundational Foundry project, including Catapula and Nouns protocol smart contracts, as well as deployment scripts.

Requirements

- [Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [Node.js 18v](https://gist.github.com/d2s/372b5943bce17b964a79)
- [Foundry](https://book.getfoundry.sh/)

## Getting Started

Click "Use this template" to create a new repository with this repo as the initial state.

## Deploy your first contract with Catapulta

1. Git clone this repository and enter to the repository directory:

```
git clone https://github.com/BuildBearLabs/Catapulta.git
cd Catapulta
```

2. Install  dependencies,

```
forge install
```
```
npm install
```

3. Generate a new private key with Catapulta, is stored offline in your .env, or add your own as `PRIVATE_KEY` in the .env file stored at the root of the project

```
npx catapulta wallet

# Output:
# Wallet address: 0x6B193d5604e09f1737E33cFc4B06fb3f2C7fC3CE
# Private key appended to your .env file.
```

4. Setup your `CATAPULTA_API_KEY` into your .env, generate one at [Catapulta dashboard](https://catapulta.sh)
5. To deploy the contracts to the Ethereum Mainnet fork, run the following command. This command creates a Private Ethereum Mainnet fork from the latest block, deploys and verifies your contracts on Private Testnet.

```
 catapulta script scripts/DeployContracts.s.sol --fork buildbear --network main
```
  ![terminal](https://strapi.buildbear.io/uploads/Untitled_2023_10_30_T170835_510_cf10dd3085.png?updated_at=2023-10-30T11:39:25.357Z)


6. Access the deployment report conveniently through the Catapulta UI. 
    - All deployed contracts are conveniently listed for your reference.
    - Access essential Testnet details, including the Block Explorer, to view transactions and interact with your deployed contracts.
    - Utilize the Faucet to mint unlimited native and ERC20 Tokens.
    - Copy the RPC for seamless connectivity to your Testnet within your Hardhat and Foundry projects, allowing you to execute scripts with ease.
 ![basic 2](https://strapi.buildbear.io/uploads/Untitled_2023_10_30_T171147_750_b038ebb735.png?updated_at=2023-10-30T11:42:12.931Z)
 ![basic 3](https://strapi.buildbear.io/uploads/Untitled_2023_10_30_T171248_729_f7b3fa30de.png?updated_at=2023-10-30T11:43:01.255Z)

7. Click on the deployed contract address, and you will be redirected to the contract page on the BuildBear Explorer. From there, you can interact with the read and write functions of your contract to test its functionality.
![basic 4](https://strapi.buildbear.io/uploads/Untitled_2023_10_30_T171423_197_caa0d4db97.png?updated_at=2023-10-30T11:44:40.880Z)


## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.
