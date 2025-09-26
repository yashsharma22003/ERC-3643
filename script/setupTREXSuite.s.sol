// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {ITREXFactory} from "../lib/ERC-3643/contracts/factory/ITREXFactory.sol";

contract setupTREXSuite is Script {
   
    address public factoryAddress = 0x0000000000000000000000000000000000000000;


    string public salt = "zkETHer-Securities-Token";
 

    function run() external {
        require(factoryAddress != address(0), "Error: factoryAddress is not set. Please update the script.");

        vm.startBroadcast();

        ITREXFactory factory = ITREXFactory(factoryAddress);

      
        address tokenOwner = 0x0af700A3026adFddC10f7Aa8Ba2419e8503592f7; 

   
        address[] memory irAgents = new address[](1);
        irAgents[0] = 0x0af700A3026adFddC10f7Aa8Ba2419e8503592f7; 

        address[] memory tokenAgents = new address[](1);
        tokenAgents[0] = 0x0af700A3026adFddC10f7Aa8Ba2419e8503592f7; 

        ITREXFactory.TokenDetails memory tokenDetails = ITREXFactory.TokenDetails({
            owner: tokenOwner,
            name: "Security Token",
            symbol: "STK",
            decimals: 18,
            irs: address(0), 
            ONCHAINID: address(0), 
            irAgents: irAgents,
            tokenAgents: tokenAgents,
            complianceModules: new address[](0), 
            complianceSettings: new bytes[](0)   
        });
       


     
        uint256[] memory claimTopics = new uint256[](1);
        claimTopics[0] = 42;
 
        address[] memory claimIssuers = new address[](1);
        claimIssuers[0] = 0x0000000000000000000000000000000000000000; //contract that issues the claims

     
        uint256[][] memory issuerClaims = new uint256[][](1);
        issuerClaims[0] = new uint256[](1);
        issuerClaims[0][0] = claimTopics[0]; 

        ITREXFactory.ClaimDetails memory claimDetails = ITREXFactory.ClaimDetails({
            claimTopics: claimTopics,
            issuers: claimIssuers,
            issuerClaims: issuerClaims
        });


        console.log("Deploying T-REX suite with salt:", salt);
        console.log("Token Owner:", tokenDetails.owner);
        console.log("Factory Address:", address(factory));

       
        factory.deployTREXSuite(salt, tokenDetails, claimDetails);


        console.log("\n Successfully sent transaction to deploy the T-REX suite.");
        console.log("Note: To find the addresses of the newly deployed contracts, check the `TREXSuiteDeployed` event logs from this transaction.");

        vm.stopBroadcast();
    }
}
