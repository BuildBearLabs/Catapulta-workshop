// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import {DEX} from "../src/DEX.sol";
import {Tokens} from "../src/Tokens.sol";

contract DeployContracts is Script {
    function run() public {
        uint256 key = vm.envUint("PRIVATE_KEY");

        address deployerAddress = vm.addr(key);

        vm.startBroadcast(key);

        // Deploy token implementation
        address tokenImpl = address(new Tokens());

        // Deploy Dex
        address dex = address(new DEX(address(tokenImpl)));

        vm.stopBroadcast();
    }
}
