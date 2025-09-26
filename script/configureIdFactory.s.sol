// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {IIdFactory} from "../lib/solidity/contracts/factory/IIdFactory.sol";

contract configureIdFactory is Script {
   
    address public idFactoryAddress = 0x0000000000000000000000000000000000000000;
    IIdFactory public idFactory = IIdFactory(idFactoryAddress);

    address public trexFactoryAddress = 0x0000000000000000000000000000000000000000;

    function run() external {
       

        vm.startBroadcast();

        console.log("Setting Token Factory address to:", trexFactoryAddress);  
        idFactory.addTokenFactory(trexFactoryAddress);
        idFactory.isTokenFactory(trexFactoryAddress);
        console.log("Successfully sent transaction to set Token Factory.");

        vm.stopBroadcast();
    }
}
