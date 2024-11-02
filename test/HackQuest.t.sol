// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {HackQuest} from "../src/HackQuest.sol";

contract HackQuestTest is Test {
    HackQuest public hackquest;
    address alice = address(1);
    address bob = address(2);   

    function setUp() public {
        address signer = address(0x2F380B03E9b53CE91F0D74A5eE020Cd1Afc99C96);
        hackquest = new HackQuest(signer);

        vm.startPrank(alice);
        hackquest.safeMint();
        assertEq(hackquest.balanceOf(alice), 1);
        assertEq(hackquest.ownerOf(0), alice);

        vm.startPrank(bob);
        hackquest.safeMint();
        assertEq(hackquest.balanceOf(bob), 1);
        assertEq(hackquest.ownerOf(1), bob);
    }

    function test_Signer() view public {
        assertEq(hackquest._signer(), address(0x2F380B03E9b53CE91F0D74A5eE020Cd1Afc99C96));
    }

    function test_UpdateCourseProgress() public {
        hackquest.updateCourseProgress(1, 1, hex"02cef286dfde4efa77b19e9769239087f2d769743faa74a7e2990bbc899caf841338da3236682ec771c46eaf4ebb4ddd7214c0976dc28f99bbc629c0c917be241b");
        assertEq(uint8(hackquest._courseProgress(1)), 1);
    }

    function test_RevertWhen_CallerIsNotOwner() public {
        vm.startPrank(bob);
        hackquest.updateCourseProgress(1, 1, hex"02cef286dfde4efa77b19e9769239087f2d769743faa74a7e2990bbc899caf841338da3236682ec771c46eaf4ebb4ddd7214c0976dc28f99bbc629c0c917be241b");
        assertEq(uint8(hackquest._courseProgress(1)), 1);
        
        vm.expectRevert("Signature Already Used");
        hackquest.updateCourseProgress(1, 1, hex"02cef286dfde4efa77b19e9769239087f2d769743faa74a7e2990bbc899caf841338da3236682ec771c46eaf4ebb4ddd7214c0976dc28f99bbc629c0c917be241b");
    }
}
