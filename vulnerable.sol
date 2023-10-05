// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsecureRandomness {
    address public owner;
    uint256 public secretNumber;
    uint256 public lastBlockNumber;

    constructor() {
        owner = msg.sender;
        lastBlockNumber = block.number;
    }

    // Function to set a secret number based on blockhash
    function setSecretNumber() public {
        require(msg.sender == owner, "Only the owner can set the secret number.");
        require(block.number > lastBlockNumber, "Wait for the next block to set the secret number.");

        // Generate pseudo-random number using blockhash
        secretNumber = uint256(blockhash(lastBlockNumber));

        // Update the last block number
        lastBlockNumber = block.number;
    }
}
