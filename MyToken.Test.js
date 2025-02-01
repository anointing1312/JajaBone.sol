const { expect } = require("chai");

describe("MyToken", function () {
    let MyToken, myToken, owner, addr1, addr2;

    beforeEach(async function () {
        [owner, addr1, addr2] = await ethers.getSigners();
        MyToken = await ethers.getContractFactory("MyToken");
        myToken = await MyToken.deploy(1000000); // Deploy with 1 million tokens
    });

    it("Should deploy with the correct initial supply", async function () {
        const totalSupply = await myToken.totalSupply();
        expect(totalSupply.toString()).to.equal("1000000000000000000000000"); // 1 million tokens with 18 decimals
    });

    it("Should transfer tokens between accounts", async function () {
        await myToken.transfer(addr1.address, 100);
        const balance = await myToken.balanceOf(addr1.address);
        expect(balance.toString()).to.equal("100");
    });

    it("Should fail if sender doesn’t have enough tokens", async function () {
        await expect(myToken.connect(addr1).transfer(addr2.address, 100)).to.be.revertedWith("Insufficient balance");
    });
});