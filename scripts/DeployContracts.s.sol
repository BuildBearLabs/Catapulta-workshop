// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import { IManager, Manager } from "../src/manager/Manager.sol";
import { IToken, Token } from "../src/token/Token.sol";
import { MetadataRenderer } from "../src/token/metadata/MetadataRenderer.sol";
import { IAuction, Auction } from "../src/auction/Auction.sol";
import { IGovernor, Governor } from "../src/governance/governor/Governor.sol";
import { ITreasury, Treasury } from "../src/governance/treasury/Treasury.sol";
import { MetadataRenderer } from "../src/token/metadata/MetadataRenderer.sol";
import { MetadataRendererTypesV1 } from "../src/token/metadata/types/MetadataRendererTypesV1.sol";
import { ERC1967Proxy } from "../src/lib/proxy/ERC1967Proxy.sol";

contract DeployContracts is Script {


    function run() public {
        uint256 key = vm.envUint("PRIVATE_KEY");
        address weth = vm.envAddress("WETH_ADDRESS");
        address owner = vm.envAddress("MANAGER_OWNER");

        address deployerAddress = vm.addr(key);

        vm.startBroadcast(key);

        // Deploy root manager implementation + proxy
        address managerImpl0 = address(new Manager(address(0), address(0), address(0), address(0), address(0)));

        Manager manager = Manager(address(new ERC1967Proxy(managerImpl0, abi.encodeWithSignature("initialize(address)", owner))));

        // Deploy token implementation
        address tokenImpl = address(new Token(address(manager)));

        // Deploy metadata renderer implementation
        address metadataRendererImpl = address(new MetadataRenderer(address(manager)));

        // Deploy auction house implementation
        address auctionImpl = address(new Auction(address(manager), weth));

        // Deploy treasury implementation
        address treasuryImpl = address(new Treasury(address(manager)));

        // Deploy governor implementation
        address governorImpl = address(new Governor(address(manager)));

        address managerImpl = address(new Manager(tokenImpl, metadataRendererImpl, auctionImpl, treasuryImpl, governorImpl));

        // vm.prank(owner);
        // manager.upgradeTo(managerImpl);

        vm.stopBroadcast();

    }

}
