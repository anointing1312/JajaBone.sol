const { expect } = require("chai");

describe("ContractManagement", function () {
    let ContractManagement, contractManagement, owner, addr1;

    beforeEach(async function () {
        [owner, addr1] = await ethers.getSigners();
        ContractManagement = await ethers.getContractFactory("ContractManagement");
        contractManagement = await ContractManagement.deploy();
    });

    it("Should create a new contract", async function () {
        await contractManagement.createContract("Project A", "Development of a new app");
        const contract = await contractManagement.readContract(1);
        expect(contract.name).to.equal("Project A");
        expect(contract.description).to.equal("Development of a new app");
        expect(contract.isActive).to.equal(true);
    });

    it("Should update an existing contract", async function () {
        await contractManagement.createContract("Project A", "Development of a new app");
        await contractManagement.updateContract(1, "Project A Updated", "Updated description", false);
        const contract = await contractManagement.readContract(1);
        expect(contract.name).to.equal("Project A Updated");
        expect(contract.description).to.equal("Updated description");
        expect(contract.isActive).to.equal(false);
    });

    it("Should delete a contract", async function () {
        await contractManagement.createContract("Project A", "Development of a new app");
        await contractManagement.deleteContract(1);
        const contract = await contractManagement.readContract(1);
        expect(contract.isActive).to.equal(false);
    });
});