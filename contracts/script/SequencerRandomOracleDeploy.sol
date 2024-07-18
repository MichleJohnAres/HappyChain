// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SequencerRandomOracle} from "../src/SequencerRandomOracle.sol";

contract SequencerRandomOracleDeployScript is Script {
    SequencerRandomOracle public sequencerRandomOracle;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        sequencerRandomOracle = new SequencerRandomOracle();
        vm.stopBroadcast();
    }
}
