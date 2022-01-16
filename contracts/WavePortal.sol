// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    address[] public addresses;
    mapping(address => bool) addressExists;

    constructor() {
        console.log("Yo yo, I am a contract and I am smart\n");
    }

    function wave() public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        updateAddresses(msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!\n", totalWaves);
        return totalWaves;
    }

    function updateAddresses(address sender) private {
        if (!addressExists[sender]) {
            addressExists[sender] = true;
            addresses.push(sender);
        }
    }

    function getAddresses() public view returns (address[] memory) {
        address[] memory tmpAddresses = addresses;
        console.log("List of unique addresses that waved:");
        for(uint32 i = 0; i < tmpAddresses.length; ++i) {
            console.log(tmpAddresses[i]);
        }
        return tmpAddresses;
    }
}
