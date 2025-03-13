// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {FactoryContract} from "../src/FactoryContract.sol";

contract CounterScript is Script {
   function run() public returns(FactoryContract){
    vm.startBroadcast();

    FactoryContract factory = new FactoryContract();

    vm.stopBroadcast();
    return factory;
   }
}

