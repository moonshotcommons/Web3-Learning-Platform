// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {HackQuest} from "../src/HackQuest.sol";

contract HackQuestScript is Script {
    HackQuest public hackquest;

    function setUp() public {}

    function run() public {
        uint256 deployer = vm.envUint("DEPLOYER_PRIVATE_KEY");

        vm.startBroadcast(deployer);        
        hackquest = new HackQuest(address(0x2F380B03E9b53CE91F0D74A5eE020Cd1Afc99C96));

        vm.stopBroadcast();
    }
}
