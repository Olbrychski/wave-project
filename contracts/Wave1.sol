// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    constructor() {
        console.log("Contract Wave");
    }

    uint[] public wavers; //store waver
    
    //mappings
    mapping (uint => address) public waveToOwner;
    mapping (address => uint) ownerWaveCount;

    function wave() public {    
        uint id;

       unchecked {id = wavers.push() - 1;} 
        waveToOwner[id] = msg.sender;
        ownerWaveCount[msg.sender]++;

        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getNumberOfWaves(address _waver) external view returns(uint) {
        //uint[] memory result = new uint[](ownerWaveCount[_waver]);
        //uint[] memory result = ownerWaveCount[_waver];
        console.log("%s has waved %d times!", _waver, ownerWaveCount[_waver]);



        return ownerWaveCount[_waver]; 
        
    }

    
}