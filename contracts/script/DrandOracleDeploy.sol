// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {DrandOracle} from "../src/DrandOracle.sol";

contract DrandOracleDeployScript is Script {
    DrandOracle public drandOracle;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        drandOracle = new DrandOracle();
        vm.stopBroadcast();
    }
}
