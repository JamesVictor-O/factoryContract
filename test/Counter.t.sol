// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {FactoryContract} from "../src/FactoryContract.sol";

contract CounterTest is Test {
    FactoryContract public factoryContract;

    function setUp() public {
        factoryContract = new FactoryContract();
    }

  
    function testFuzz_DeployErc20() public {
        factoryContract.deployErc20("DurantToken", "DUR", address(this), 1000);
        assertEq(factoryContract.deployedErc20Count(), 1);
    }
    
}
