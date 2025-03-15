// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import {ERC721Token} from "./../src/ERC721.sol";
import {DurantToke} from "./../src/ERC20.sol";

contract FactoryContract {
    uint public deployedErc20Count;
    uint public deployedErc721Count;
    address[] public erc20Contracts;
    address[] public erc721Contracts;

    struct ERC20TokenDetails {
        string name;
        string symbol;
        address deployer;
        uint256 totalSupply;
        address deployedErc20;
    }

    struct ERC721TokenDetails {
        string name;
        string symbol;
        address deployer;
        string url;
        address deployedNft;
    }

    mapping(address => bool) public isErc20;
    mapping(address => bool) public isErc721;

    mapping(address => ERC20TokenDetails[]) public userDeployedErc20;
    mapping(address => ERC721TokenDetails[]) public userDeployedErc721;

    event ERC20TokenDeployed(address indexed erc20Contract, string  name, string  symbol, address  deployer, uint256 totalSupply);
    event ERC721TokenDeployed(address indexed erc721Contract, string  name, string symbol, address  deployer, string url);

    function deployErc20(
        string memory _name,
        string memory _symbol,
        uint _totalSupply
    ) public {
        require(bytes(_name).length > 0 && bytes(_symbol).length > 0, "Name and symbol cannot be empty");
        require(_totalSupply > 0, "Total supply must be greater than 0");

        DurantToke erc20 = new DurantToke(
            _name,
            _symbol,
            _totalSupply,
            msg.sender
        );
        erc20Contracts.push(address(erc20));
        isErc20[address(erc20)] = true;
        deployedErc20Count++;

        userDeployedErc20[msg.sender].push(ERC20TokenDetails({
            name: _name,
            symbol: _symbol,
            deployer: msg.sender,
            totalSupply: _totalSupply,
            deployedErc20: address(erc20)
        }));

        emit ERC20TokenDeployed(address(erc20), _name, _symbol, msg.sender, _totalSupply);
    }

    function deployErc721(
        string memory _name,
        string memory _symbol,
        address _deployer,
        string memory _url
    ) public {
        require(bytes(_name).length > 0 && bytes(_symbol).length > 0, "Name and symbol cannot be empty");
        require(_deployer != address(0), "Invalid deployer address");
        require(bytes(_url).length > 0 && (bytes(_url)[0] == 'h' && bytes(_url)[1] == 't'), "Invalid URL");

        ERC721Token erc721 = new ERC721Token(_name, _symbol);
        erc721Contracts.push(address(erc721));
        isErc721[address(erc721)] = true;
        erc721.mintTo(_deployer, _url);
        deployedErc721Count++;

        userDeployedErc721[msg.sender].push(ERC721TokenDetails({
            name: _name,
            symbol: _symbol,
            deployer: _deployer,
            url: _url,
            deployedNft: address(erc721)
        }));

        emit ERC721TokenDeployed(address(erc721), _name, _symbol, msg.sender, _url);
    }

    function getUserDeployedErc20(address user) public view returns (ERC20TokenDetails[] memory) {
        return userDeployedErc20[user];
    }

    function getUserDeployedErc721(address user) public view returns (ERC721TokenDetails[] memory) {
        return userDeployedErc721[user];
    }
}








