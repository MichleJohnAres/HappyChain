// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import {Test, console} from "forge-std/Test.sol";
import {DrandOracle} from "../src/DrandOracle.sol";

contract DrandOracleTest is Test {
    DrandOracle public drandOracle;

    function setUp() public {
        drandOracle = new DrandOracle();
    }
    
    function testFuzz_updateDrand(uint256 timestamp, bytes32 value) public {
        drandOracle.updateDrand(timestamp, value);
        assertEq(drandOracle.unsafeGetDrand(timestamp), value);
    }
}