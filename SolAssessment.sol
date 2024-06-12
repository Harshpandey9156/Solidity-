// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;


contract MyToken {

    // Public variables
    string public name;
    string public symbol;
    uint256 public totalSupply;

    
  
    // Constructor to initialize the token name and symbol
    constructor() {
        name = "Sachin Tendulkar";
        symbol = "SACHIN";
        totalSupply = 0;
    }

      // Mapping to store balances
    mapping(address => uint256) public balances;



    // Events to log minting and burning actions
    event Mint(address indexed to, uint256 amount);
    event Burn(address indexed from, uint256 amount);

    

    // Mint function to create new tokens and assign them to an address
    function mint(address _to, uint256 _amount) public {
        require(_to != address(0), "Cannot mint to the zero address");
        totalSupply += _amount;
        balances[_to] += _amount;
        emit Mint(_to, _amount); // Emit mint event
    }

    // Burn function to destroy tokens from an address
    function burn(address _from, uint256 _amount) public {
        require(_from != address(0), "Cannot burn from the zero address");
        require(balances[_from] >= _amount, "Insufficient balance to burn");
        totalSupply -= _amount;
        balances[_from] -= _amount;
        emit Burn(_from, _amount); // Emit burn event
    }
}
