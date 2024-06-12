# Solidity-

# MyToken Solidity Smart Contract

This repository contains a simple Solidity smart contract for an ERC-20-like token named "Sachin Tendulkar" with the symbol "SACHIN". The contract allows minting and burning of tokens.

## Overview

The `MyToken` contract is a basic implementation of a token with minting and burning functionality. It includes:

- A token name (`Sachin Tendulkar`) and symbol (`SACHIN`).
- A `totalSupply` variable to keep track of the total number of tokens in circulation.
- A `balances` mapping to store the balance of tokens for each address.
- `mint` and `burn` functions to create and destroy tokens respectively.
- Events to log minting and burning actions.

## Prerequisites

To use this contract, you'll need access to [Remix](https://remix.ethereum.org/), an online Solidity IDE.

## Getting Started

1. **Open Remix:**

   Go to [Remix](https://remix.ethereum.org/) in your web browser.

2. **Create a New File:**

   - In the file explorer pane on the left, click the "+" button to create a new file.
   - Name your file `MyToken.sol`.

3. **Copy the Contract Code:**

   Copy the following Solidity code into your newly created `MyToken.sol` file:

   ```solidity
   // SPDX-License-Identifier: MIT

   pragma solidity ^0.8.18;

   contract MyToken {

       // Public variables
       string public name;
       string public symbol;
       uint256 public totalSupply;
       
       // Mapping to store balances
       mapping(address => uint256) public balances;

       // Events to log minting and burning actions
       event Mint(address indexed to, uint256 amount);
       event Burn(address indexed from, uint256 amount);

       // Constructor to initialize the token name and symbol
       constructor() {
           name = "Sachin Tendulkar";
           symbol = "SACHIN";
           totalSupply = 0;
       }

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
