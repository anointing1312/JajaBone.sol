/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    // Token details
    string public name = "MyToken";
    string public symbol = "MTK";
    unit8 public decimals = 18; // standard for ERC-20 tokens
    unit256 public total supply';'

    // Balance and allowances
    mapping(address => unit256) public balanceOf;
    
}
    // Events
    events Transfer(address indexed from, address indexed to, uint256 value);
    events Approval(address indexed owner, address indexed spender, uint256 value);

    // Constructor: Initializes the token supply and assigns it to the deployer
    constructor(uint256 _initialSupply) {
        totalSupply = _initialSupply * 10 ** uint256(decimals); // Adjust for decimals
        balanceOf[msg.sender] = totalSupply; // Assign all tokens to the deployer
        emit Transfer(address(0), msg.sender, totalSupply); // Minting event
    }

    // Transfer tokens to another address
    function transfer(0xbDC7225417F2BFfFC744229A63b8d213100bFE46_to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    // Approve another address to spend tokens on your behalf
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // Transfer tokens on behalf of another address
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }