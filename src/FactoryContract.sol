// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28; 
import { ERC721Token } from "./../src/ERC721.sol";
import {DurantToke} from "./../src/ERC20.sol";

contract FactoryContract {
    uint public deployedErc20Count;
    uint public deployedErc721Count;
    address[] public erc20Contracts;
    address[] public erc721Contracts;

    mapping(address=>bool) public isErc20;
    mapping(address=>bool) public isErc721;

    event ERC20Deployed(address indexed erc20Contract, address indexed owner);
    event ERC721Deployed(address indexed erc721Contract, address indexed owner);

    function deployErc20(string memory _name, string memory _symbol, address _deployer, uint _totalSupply) public {
        DurantToke erc20 = new DurantToke(_name, _symbol,_totalSupply,_deployer);
        erc20Contracts.push(address(erc20));
        isErc20[address(erc20)] = true;
        deployedErc20Count++;
        emit ERC20Deployed(address(erc20), _deployer);
    }

    function deployErc721(string memory _name, string memory _symbol, address _deployer, string memory _url) public {
        ERC721Token erc721 = new ERC721Token(_name, _symbol);
        erc721Contracts.push(address(erc721));
        isErc721[address(erc721)] = true;
        erc721.mintTo(_deployer, _url);
        deployedErc721Count++;
        emit ERC721Deployed(address(erc721), msg.sender);
    }

    function getDeployedErc20() public view returns(address[] memory) {
        return erc20Contracts;
    }
    function getDeployedErc721() public view returns(address[] memory) {
        return erc721Contracts;
    }

}
