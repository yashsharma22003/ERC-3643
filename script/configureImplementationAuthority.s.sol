//SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "../lib/forge-std/src/console.sol";

import {ITREXImplementationAuthority} from "../lib/ERC-3643/contracts/proxy/authority/ITREXImplementationAuthority.sol";

contract configureImplementationAuthority is Script {

    address public implementationAuthorityAddress = 0x0000000000000000000000000000000000000000; 
   
    
    ITREXImplementationAuthority.TREXContracts public trexcontracts = ITREXImplementationAuthority.TREXContracts({
        tokenImplementation: 0x0000000000000000000000000000000000000000,
        ctrImplementation: 0x0000000000000000000000000000000000000000,
        irImplementation: 0x0000000000000000000000000000000000000000,
        irsImplementation: 0x0000000000000000000000000000000000000000,
        tirImplementation: 0x0000000000000000000000000000000000000000,
        mcImplementation: 0x0000000000000000000000000000000000000000
    });

    ITREXImplementationAuthority.Version public trexVersion = ITREXImplementationAuthority.Version({
        major: 1,
        minor: 0,
        patch: 0
    });

    function run() external {
        vm.startBroadcast();
        ITREXImplementationAuthority authority = ITREXImplementationAuthority(implementationAuthorityAddress);
        authority.addAndUseTREXVersion(trexVersion, trexcontracts);

        vm.stopBroadcast();
        console.log("TREXImplementationAuthority configured successfully.");
    }
}
