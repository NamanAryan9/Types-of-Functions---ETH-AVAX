// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "ERC20.sol";

contract Mtoken is ERC20 {

    address owner = msg.sender;

    modifier onlyOwner { 
        require (owner == msg.sender, "only owner can access");
        _;
    }

    constructor(string memory name, string memory symbol) ERC20(name, symbol) onlyOwner{
        _mint(msg.sender, 100 * 10**uint(decimals()));
    }

    function burn_token(address a, uint256 b) external {
        _burn(a, b);
    }

    function transfer_token(address a,uint256 b) external  {
        _transfer(msg.sender, a, b);
    }
}
