const { ethers } = require("hardhat");

async function main() {
  const whiteListContract = await ethers.getContractFactory("Whitelist");

  const deployedWhiteListContract = await whiteListContract.deploy(10);

  await deployedWhiteListContract.deployed();

  console.log("Whitelist Contract Address", deployedWhiteListContract.address);
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
