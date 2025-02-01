quire("hardhat");

async function main() {
    const initialSupply = 1000000; // 1 million tokens
    const MyToken = await hre.ethers.getContractFactory("MyToken");
    const myToken = await MyToken.deploy(initialSupply);

    await myToken.deployed();

    console.log("MyToken deployed to:", myToken.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});