// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract madmax is ERC20 {
    address owner;

    constructor() ERC20("clement", "CLEM") {
        owner = msg.sender;
        _mint(owner, 500 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public  {
        require(msg.sender == owner, "Only owner can mint");
        _mint(to, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
        
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
