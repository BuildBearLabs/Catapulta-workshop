pragma solidity >=0.8.0 <0.9.0;
// SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Tokens is ERC20 {
    constructor() ERC20("Balloons", "BAL") {
        _mint(msg.sender, 1000 ether); // mints 1000 balloons!
    }

    function mint() public {
        _mint(msg.sender, 1000 ether);
    }
}
