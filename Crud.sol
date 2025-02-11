// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ContractManagement {
    // Struct to represent a contract
    struct Contract {
        uint256 contractId;
        string name;
        string description;
        bool isActive; // Status of the contract
    }

    // Mapping to store contracts by their ID
    mapping(uint256 => Contract) public contracts;

    // Counter to generate unique contract IDs
    uint256 public contractCounter;

    // Events
    event ContractCreated(uint256 contractId, string name, string description);
    event ContractUpdated(uint256 contractId, string name, string description, bool isActive);
    event ContractDeleted(uint256 contractId);

    // Create a new contract
    function createContract(string memory _name, string memory _description) public {
        contractCounter++; // Increment the counter for a new contract ID
        contracts[contractCounter] = Contract({
            contractId: contractCounter,
            name: _name,
            description: _description,
            isActive: true
        });
        emit ContractCreated(contractCounter, _name, _description);
    }

    // Read a contract by its ID
    function readContract(uint256 _contractId) public view returns (
        uint256 contractId,
        string memory name,
        string memory description,
        bool isActive
    ) {
        Contract memory contractData = contracts[_contractId];
        require(contractData.contractId != 0, "Contract does not exist");
        return (
            contractData.contractId,
            contractData.name,
            contractData.description,
            contractData.isActive
        );
    }

    // Update an existing contract
    function updateContract(
        uint256 _contractId,
        string memory _name,
        string memory _description,
        bool _isActive
    ) public {
        require(contracts[_contractId].contractId != 0, "Contract does not exist");
        contracts[_contractId].name = _name;
        contracts[_contractId].description = _description;
        contracts[_contractId].isActive = _isActive;
        emit ContractUpdated(_contractId, _name, _description, _isActive);
    }

    // Delete a contract (mark as inactive)
    function deleteContract(uint256 _contractId) public {
        require(contracts[_contractId].contractId != 0, "Contract does not exist");
        contracts[_contractId].isActive = false;
        emit ContractDeleted(_contractId);
    }
}