// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {ITREXImplementationAuthority} from "../lib/ERC-3643/contracts/proxy/authority/ITREXImplementationAuthority.sol";

contract setImplementationAuthorityFactory is Script {

    address public authorityAddress = 0x0000000000000000000000000000000000000000;


    address public trexFactoryAddress = 0x0000000000000000000000000000000000000000;

    function run() external {

        vm.startBroadcast();

        ITREXImplementationAuthority authority = ITREXImplementationAuthority(authorityAddress);

        console.log("Target TREXImplementationAuthority:", authorityAddress);

        authority.setTREXFactory(trexFactoryAddress);


        console.log("TREXFactory address set in TREXImplementationAuthority:", trexFactoryAddress);

        vm.stopBroadcast();
    }
}
