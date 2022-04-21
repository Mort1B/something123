const { ethers } = require("hardhat");

async function main() {
    /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  so whitelistContract here is a factory for instances of our Whitelist contract.
  */

    const whitelistContract = await ethers.getContractFactory("Whitelist");

    //here we deploy the contract, 10 is max spots
    const deployedWhitelistContract = await whitelistContract.deploy(10);

    //wait for it to deploy
    await deployedWhitelistContract.deployed();

    //print whitelisted address
    console.log("Whitelist Contract Address", deployedWhitelistContract.address);
}

//call main function and catch error
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    })