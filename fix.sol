// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract SecureRandomness is VRFConsumerBase {
    address public owner;
    uint256 public secretNumber;
    bytes32 public requestId;

    constructor(address _vrfCoordinator, address _linkToken) VRFConsumerBase(_vrfCoordinator, _linkToken) {
        owner = msg.sender;
    }

    function requestRandomNumber() public {
        require(msg.sender == owner, "Only the owner can request a random number.");
        requestId = requestRandomness(bytes32(block.number), 1); // Request a random number with the block number as the seed
    }

    function fulfillRandomness(bytes32 _requestId, uint256 _randomNumber) internal override {
        require(_requestId == requestId, "Invalid request ID");
        secretNumber = _randomNumber % 100; // Limit the secret number to a range (0-99)
    }
}
