// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./DrandOracle.sol";
import "./SequencerRandomOracle.sol";

contract RandomnessOracle {
    DrandOracle public drandOracle;
    SequencerRandomOracle public sequencerRandomOracle;
    uint256 public constant DELAY = 9;

    constructor(address _drandOracle, address _sequencerRandomOracle) {
        drandOracle = DrandOracle(_drandOracle);
        sequencerRandomOracle = SequencerRandomOracle(_sequencerRandomOracle);
    }

    function getRandomness(uint256 timestamp) public view returns (bytes32) {
        bytes32 drandValue = drandOracle.getDrand(timestamp - DELAY);
        bytes32 sequencerValue = sequencerRandomOracle.getSequencerRandom(timestamp);
        if (drandValue == bytes32(0) || sequencerValue == bytes32(0)) {
            return bytes32(0);
        }
        return keccak256(abi.encodePacked(drandValue, sequencerValue));
    }

    function unsafeGetRandomness(uint256 timestamp) public view returns (bytes32) {
        bytes32 drandValue = drandOracle.unsafeGetDrand(timestamp - DELAY);
        bytes32 sequencerValue = sequencerRandomOracle.unsafeGetSequencerRandom(timestamp);
        return keccak256(abi.encodePacked(drandValue, sequencerValue));
    }

    function willRandomnessBeAvailable(uint256 timestamp) public view returns (bool) {
        return drandOracle.willDrandBeAvailable(timestamp - DELAY) && sequencerRandomOracle.willSequencerRandomBeAvailable(timestamp);
    }
}
