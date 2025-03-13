

// contract ERC721 {
//     string private _name;
//     string private _symbol;

//     mapping(uint256 tokenId => address) private _owners;
//     mapping(address owner => uint256) private _balances;
//     mapping(uint256 tokenId => address) private _tokenApprovals;
//     mapping(address owner => mapping(address operator => bool)) private _operatorApprovals;

//     event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
//     event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
//     event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

//     constructor(string memory name_, string memory symbol_) {
//         _name = name_;
//         _symbol = symbol_;
//     }

//     function balanceOf(address owner) public view virtual returns (uint256) {
//         require(owner != address(0), "Invalid address");
//         return _balances[owner];
//     }

//     function ownerOf(uint256 tokenID) public view virtual returns (address) {
//         return _requireOwned(tokenID);
//     }

//     function name() public view virtual returns (string memory) {
//         return _name;
//     }

//     function symbol() public view virtual returns (string memory) {
//         return _symbol;
//     }

//     function tokenURI(
//         uint tokenID
//     ) public view virtual returns (string memory) {
//         _requireOwned(tokenID);
//         string memory baseURI = _baseURI();
//         return
//             bytes(baseURI).length > 0
//                 ? string.concat(baseURI, tokenID.toString())
//                 : "";
//     }

//     function _baseURI() internal view virtual returns (string memory) {
//         return "";
//     }

//     function approve(address to, uint256 tokenId) public virtual {
//         _approve(to, tokenId, msg.sender);
//     }

//     function getApproved(
//         uint256 tokenId
//     ) public view virtual returns (address) {
//         _requireOwned(tokenId);

//         return _getApproved(tokenId);
//     }

//     function setApprovalForAll(address operator, bool approved) public virtual {
//     _setApprovalForAll(msg.sender, operator, approved);
//    }

//     function isApprovedForAll(
//         address owner,
//         address operator
//     ) public view virtual returns (bool) {
//         return _operatorApprovals[owner][operator];
//     }

//     function transferFrom(
//         address from,
//         address to,
//         uint256 tokenId
//     ) public virtual {
//         require(to != address(0), "Invalid address");
//         address previousOwner = _update(to, tokenId, msg.sender);

//         require(previousOwner != from, "Incorrect address");
//     }

//     function safeTransferFrom(
//         address from,
//         address to,
//         uint256 tokenId
//     ) public {
//         safeTransferFrom(from, to, tokenId, "");
//     }

//     function _ownerOf(uint256 tokenId) internal view virtual returns (address) {
//         return _owners[tokenId];
//     }

//     function _getApproved(
//         uint256 tokenId
//     ) internal view virtual returns (address) {
//         return _tokenApprovals[tokenId];
//     }

//     function _isAuthorized(
//         address owner,
//         address spender,
//         uint256 tokenId
//     ) internal view virtual returns (bool) {
//         return
//             spender != address(0) &&
//             (owner == spender ||
//                 isApprovedForAll(owner, spender) ||
//                 _getApproved(tokenId) == spender);
//     }

//      function _setApprovalForAll(address owner, address operator, bool approved) internal virtual {
//          require(operator != address(0), "Invalid address");
//         _operatorApprovals[owner][operator] = approved;
//     }

//     function _checkAuthorized(
//         address owner,
//         address spender,
//         uint256 tokenId
//     ) internal view virtual {
//         if (!_isAuthorized(owner, spender, tokenId)) {
//             require(owner != address(0), "Invalid address");
//         }
//     }

//     function _increaseBalance(address account, uint128 value) internal virtual {
//         unchecked {
//             _balances[account] += value;
//         }
//     }

//     function _update(
//         address to,
//         uint256 tokenId,
//         address auth
//     ) internal virtual returns (address) {
//         address from = _ownerOf(tokenId);

//         if (auth != address(0)) {
//             _checkAuthorized(from, auth, tokenId);
//         }

//         if (from != address(0)) {
//             _approve(address(0), tokenId, address(0), false);

//             unchecked {
//                 _balances[from] -= 1;
//             }
//         }

//         if (to != address(0)) {
//             unchecked {
//                 _balances[to] += 1;
//             }
//         }

//         _owners[tokenId] = to;

//         emit Transfer(from, to, tokenId);

//         return from;
//     }

//     function _mint(address to, uint256 tokenId) internal {
//         require(to != address(0), "Invalid address");
//         address previousOwner = _update(to, tokenId, address(0));
//         require(previousOwner != address(0), "Invalid address");
//     }

//     function _safeMint(address to, uint256 tokenId) internal {
//         _safeMint(to, tokenId, "");
//     }

//     function _safeMint(
//         address to,
//         uint256 tokenId,
//         bytes memory data
//     ) internal virtual {
//         _mint(to, tokenId);
//     }

//     function _burn(uint256 tokenId) internal {
//         address previousOwner = _update(address(0), tokenId, address(0));
//         require(previousOwner != address(0), "Invalid address");
//     }

//     function _transfer(address from, address to, uint256 tokenId) internal {
//         require(to != address(0), "Invalid address");
//         address previousOwner = _update(to, tokenId, address(0));
//         require(previousOwner != address(0), "Invalid address");
//     }

//     function _safeTransfer(address from, address to, uint256 tokenId) internal {
//         _safeTransfer(from, to, tokenId, "");
//     }

//     function _approve(address to, uint256 tokenId, address auth) internal {
//         _approve(to, tokenId, auth, true);
//     }

//     function _approve(
//         address to,
//         uint256 tokenId,
//         address auth,
//         bool emitEvent
//     ) internal virtual {
//         if (emitEvent || auth != address(0)) {
//             address owner = _requireOwned(tokenId);

//             require(
//                 auth == address(0) ||
//                     owner == auth ||
//                     isApprovedForAll(owner, auth),
//                 "Unauthorized approver"
//             );

//         }

//         _tokenApprovals[tokenId] = to;
//     }

//     function _requireOwned(uint256 tokenId) internal view returns (address) {
//         address owner = _ownerOf(tokenId);
//         require(owner != address(0), "NonexistentToken");
//         return owner;
//     }

// }

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.28;

import "../src/interface/IERC721Receiver.sol";

contract ERC721Token {
    string public name;
    string public symbol;
    uint public nextTokenIdToMint;
    address public contractOwner;

    // token id => owners
    mapping(uint => address) internal _owners;
    //owner => token count
    mapping(address => uint) internal _balances;
    //token id => approved address
    mapping(uint => address) internal _tokenApprovals;
    //owner => (operator => yes/no)
    mapping(address => mapping(address => bool)) internal _operatorApprovals;
    //token id => token uri
    mapping(uint => string) internal _tokenUris;

    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);

    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
        nextTokenIdToMint = 1;
        contractOwner = msg.sender;
    }

    function balanceOf(address _owner) public view returns(uint){
        require(_owner != address(0), "! Addr0");
        return _balances[msg.sender];
    }

    function ownerOf(uint _tokenId) public view returns(address){
        return _owners[_tokenId];
    }

     function safeTransferFrom(address _from, address _to, uint256 _tokenId) public payable {
        safeTransferFrom(_from, _to, _tokenId, "");
    }

    function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes memory _data) public payable {
        require(ownerOf(_tokenId) == msg.sender || _tokenApprovals[_tokenId] == msg.sender || _operatorApprovals[ownerOf(_tokenId)][msg.sender], "!Auth");
        _transfer(_from, _to, _tokenId);
        // trigger func check
        require(_checkOnERC721Received(_from, _to, _tokenId, _data), "!ERC721Implementer");
    }

    function transferFrom(address _from, address _to, uint _tokenId) public payable {
        // unsafe transfer without onERC721Received, used for contracts that dont implement
        require(ownerOf(_tokenId) == msg.sender || _tokenApprovals[_tokenId] == msg.sender || _operatorApprovals[ownerOf(_tokenId)][msg.sender], "!Auth");
        _transfer(_from, _to, _tokenId);
    }

    function approve(address _approved, uint256 _tokenId) public payable {
        require(ownerOf(_tokenId) == msg.sender, "!Owner");
        _tokenApprovals[_tokenId] = _approved;
        emit Approval(ownerOf(_tokenId), _approved, _tokenId);
    }

    function setApprovalForAll(address _operator, bool _approved) public {
        _operatorApprovals[msg.sender][_operator] = _approved;
        emit ApprovalForAll(msg.sender, _operator, _approved);
    }

    function getApproved(uint256 _tokenId) public view returns (address) {
        return _tokenApprovals[_tokenId];
    }

    function isApprovedForAll(address _owner, address _operator) public view returns (bool) {
        return _operatorApprovals[_owner][_operator];
    }

    function mintTo(address _to, string memory _uri) public {
        require(contractOwner == msg.sender, "!Auth");
        _owners[nextTokenIdToMint] = _to;
        _balances[_to] += 1;
        _tokenUris[nextTokenIdToMint] = _uri;
        emit Transfer(address(0), _to, nextTokenIdToMint);
        nextTokenIdToMint += 1;
    }

    function tokenURI(uint256 _tokenId) public view returns(string memory) {
        return _tokenUris[_tokenId];
    }

    function totalSupply() public view returns(uint256) {
        return nextTokenIdToMint;
    }

    // Internal Functions
    function _checkOnERC721Received(address from, address to, uint tokenId, bytes memory data) private returns(bool){
        // check if to is a contract, if yes, to.code.length will always > 0
        if(to.code.length > 0){
            try IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, data) returns (bytes4 retval){
                return retval == IERC721Receiver.onERC721Received.selector;
            } catch (bytes memory reason){
                if(reason.length == 0){
                    revert("ERC721: transfer to non ERC721Receiver implementer");
                } else {
                    /// @solidity memory-safe-assembly
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        }else {
            return true;
        }
    }

    //unsafe transfer
    function _transfer(address _from, address _to, uint _tokenId) internal{
        require(ownerOf(_tokenId) == _from, "! owner");
        require(_to != address(0), "!ToAdd0");

        delete _tokenApprovals[_tokenId];
        _balances[_from] -= 1;
        _balances[_to] += 1;
        _owners[_tokenId] = _to;

        emit Transfer(_from, _to, _tokenId);
    }
}