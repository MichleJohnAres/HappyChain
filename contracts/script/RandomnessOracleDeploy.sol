// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {RandomnessOracle} from "../src/RandomnessOracle.sol";

contract RandomnessOracleDeployScript is Script {
    RandomnessOracle public randomnessOracle;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address drandOracle = vm.envAddress("DRAND_ORACLE_ADDRESS");
        address sequencerOracle = vm.envAddress(
            "SEQUENCER_RANDOM_ORACLE_ADDRESS"
        );
        vm.startBroadcast(deployerPrivateKey);
        randomnessOracle = new RandomnessOracle(drandOracle, sequencerOracle);
        vm.stopBroadcast();
    }
}
