// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SequencerRandomOracle {
    mapping(uint256 => bytes32) public commitments;
    mapping(uint256 => bytes32) public revealedValues;
    uint256 public constant PRECOMMIT_DELAY = 10;
    uint256 public constant SEQUENCER_TIMEOUT = 10;

    function commitRandom(uint256 timestamp, bytes32 commitment) external {
        require(block.timestamp <= timestamp - PRECOMMIT_DELAY, "Commitment too late");
        commitments[timestamp] = commitment;
    }

    function revealRandom(uint256 timestamp, bytes32 value) external {
        require(commitments[timestamp] != bytes32(0), "Commitment not found");
        require(block.timestamp >= timestamp, "Too early to reveal");
        require(block.timestamp <= timestamp + SEQUENCER_TIMEOUT, "Too late to reveal");
        require(keccak256(abi.encodePacked(value)) == commitments[timestamp], "Invalid value");
        revealedValues[timestamp] = value;
    }

    function getSequencerRandom(uint256 timestamp) public view returns (bytes32) {
        if (block.timestamp > timestamp + SEQUENCER_TIMEOUT) {
            return bytes32(0);
        }
        return revealedValues[timestamp];
    }

    function unsafeGetSequencerRandom(uint256 timestamp) public view returns (bytes32) {
        return revealedValues[timestamp];
    }

    function willSequencerRandomBeAvailable(uint256 timestamp) public view returns (bool) {
        return commitments[timestamp] != bytes32(0) && block.timestamp <= timestamp + SEQUENCER_TIMEOUT;
    }
}
