// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DrandOracle {
    mapping(uint256 => bytes32) public drandValues;
    uint256 public constant DRAND_TIMEOUT = 10;

    function updateDrand(uint256 timestamp, bytes32 value) external {
        drandValues[timestamp] = value;
    }

    function getDrand(uint256 timestamp) public view returns (bytes32) {
        if (block.timestamp > timestamp + DRAND_TIMEOUT) {
            return bytes32(0);
        }
        return drandValues[timestamp];
    }

    function unsafeGetDrand(uint256 timestamp) public view returns (bytes32) {
        return drandValues[timestamp];
    }

    function willDrandBeAvailable(uint256 timestamp) public view returns (bool) {
        return block.timestamp <= timestamp + DRAND_TIMEOUT;
    }
}
