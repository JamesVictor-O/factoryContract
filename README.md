# lunchpad Factory

A Solidity smart contract factory for deploying ERC20 and ERC721 tokens on the blockchain with simplified token management functionality.

## Overview

The Lunchpad Factory is a contract that enables users to deploy standardized ERC20 and ERC721 tokens without needing to write or deploy individual token contracts. The factory maintains a registry of all deployed tokens and provides functionality to verify and track tokens created through the platform.

## Features

- **ERC20 Token Deployment**: Create fungible tokens with customizable name, symbol, and total supply
- **ERC721 Token Deployment**: Create non-fungible token collections with customizable name and symbol
- **Token Registry**: Maintains lists of all deployed tokens for easy reference
- **Verification System**: Provides methods to verify if an address is an ERC20 or ERC721 token created by this factory
- **Deployment Tracking**: Counts and stores all deployed tokens with their respective addresses
- **Event Emission**: Emits events when new tokens are deployed for easy tracking off-chain

## Contract Functions

### ERC20 Token Functions

```solidity
function deployErc20(string memory _name, string memory _symbol, address _deployer, uint _totalSupply) public
```
Deploys a new ERC20 token with the specified parameters:
- `_name`: The name of the token (e.g., "Durant Token")
- `_symbol`: The token symbol (e.g., "DRT")
- `_deployer`: The address that will receive the initial token supply
- `_totalSupply`: The total supply of tokens to be minted

### ERC721 Token Functions

```solidity
function deployErc721(string memory _name, string memory _symbol, address _deployer, string memory _url) public
```
Deploys a new ERC721 token collection with the specified parameters:
- `_name`: The name of the NFT collection (e.g., "Durant Collectibles")
- `_symbol`: The NFT symbol (e.g., "DRTC")
- `_deployer`: The address that will receive the first minted NFT
- `_url`: The metadata URL for the first NFT

### View Functions

```solidity
function getDeployedErc20() public view returns(address[] memory)
```
Returns an array of all ERC20 token addresses deployed by this factory.

```solidity
function getDeployedErc721() public view returns(address[] memory)
```
Returns an array of all ERC721 token addresses deployed by this factory.

```solidity
function isErc20(address _tokenAddress) public view returns(bool)
```
Checks if the provided address is an ERC20 token deployed by this factory.

```solidity
function isErc721(address _tokenAddress) public view returns(bool)
```
Checks if the provided address is an ERC721 token deployed by this factory.

## Events

```solidity
event ERC20Deployed(address indexed erc20Contract, address indexed owner)
```
Emitted when a new ERC20 token is deployed.

```solidity
event ERC721Deployed(address indexed erc721Contract, address indexed owner)
```
Emitted when a new ERC721 token collection is deployed.

## Usage Example

```javascript
// Connect to the contract
const factoryContract = await ethers.getContractAt("FactoryContract", "0x44a5148a7D1E701C8e1052EFbc1869866F66069B");

// Deploy an ERC20 token
await factoryContract.deployErc20(
  "My Token",
  "MTK",
  "0xYourAddressHere",
  ethers.utils.parseEther("1000000") // 1 million tokens
);

// Deploy an ERC721 collection
await factoryContract.deployErc721(
  "My NFT Collection",
  "MNFT",
  "0xYourAddressHere",
  "https://metadata.example.com/token/1"
);

// Get all deployed ERC20 tokens
const erc20Tokens = await factoryContract.getDeployedErc20();
console.log("Deployed ERC20 tokens:", erc20Tokens);
```

## Security Considerations

- This factory deploys standard token implementations without additional security features
- Tokens deployed through this factory inherit any security limitations of the base implementations
- Consider performing a security audit before using in production environments

## License

UNLICENSED

## Version

Solidity ^0.8.28
```
