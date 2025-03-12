// SPDX-License-Identifier: UNLICENSED
// pragma solidity ^0.8.28;

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

pragma solidity ^0.8.28;

/**
 * @dev ERC721 token receiver interface
 */
interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

/**
 * @dev String operations
 */
library Strings {
    function toString(uint256 value) internal pure returns (string memory) {
        // This is just a simple implementation
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}

contract ERC721 {
    using Strings for uint256;

    string private _name;
    string private _symbol;

    mapping(uint256 tokenId => address) private _owners;
    mapping(address owner => uint256) private _balances;
    mapping(uint256 tokenId => address) private _tokenApprovals;
    mapping(address owner => mapping(address operator => bool))
        private _operatorApprovals;

    // ERC721 receiver interface id
    bytes4 private constant _ERC721_RECEIVED = 0x150b7a02;

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed tokenId
    );
    event Approval(
        address indexed owner,
        address indexed approved,
        uint256 indexed tokenId
    );
    event ApprovalForAll(
        address indexed owner,
        address indexed operator,
        bool approved
    );

    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function balanceOf(address owner) public view virtual returns (uint256) {
        require(
            owner != address(0),
            "ERC721: address zero is not a valid owner"
        );
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public view virtual returns (address) {
        return _requireOwned(tokenId);
    }

    function name() public view virtual returns (string memory) {
        return _name;
    }

    function symbol() public view virtual returns (string memory) {
        return _symbol;
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual returns (string memory) {
        _requireOwned(tokenId);
        string memory baseURI = _baseURI();
        return
            bytes(baseURI).length > 0
                ? string.concat(baseURI, tokenId.toString())
                : "";
    }

    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    function approve(address to, uint256 tokenId) public virtual {
        _approve(to, tokenId, msg.sender);
    }

    function getApproved(
        uint256 tokenId
    ) public view virtual returns (address) {
        _requireOwned(tokenId);
        return _getApproved(tokenId);
    }

    function setApprovalForAll(address operator, bool approved) public virtual {
        _setApprovalForAll(msg.sender, operator, approved);
    }

    function isApprovedForAll(
        address owner,
        address operator
    ) public view virtual returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual {
        require(to != address(0), "ERC721: transfer to the zero address");
        address previousOwner = _update(to, tokenId, msg.sender);
        require(previousOwner == from, "ERC721: transfer from incorrect owner");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) public virtual {
        safeTransferFrom(from, to, tokenId, "");
    }

    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) public virtual {
        require(to != address(0), "ERC721: transfer to the zero address");
        address previousOwner = _update(to, tokenId, msg.sender);
        require(previousOwner == from, "ERC721: transfer from incorrect owner");
        _checkOnERC721Received(from, to, tokenId, data);
    }

    function _ownerOf(uint256 tokenId) internal view virtual returns (address) {
        return _owners[tokenId];
    }

    function _getApproved(
        uint256 tokenId
    ) internal view virtual returns (address) {
        return _tokenApprovals[tokenId];
    }

    function _isAuthorized(
        address owner,
        address spender,
        uint256 tokenId
    ) internal view virtual returns (bool) {
        return
            spender != address(0) &&
            (owner == spender ||
                isApprovedForAll(owner, spender) ||
                _getApproved(tokenId) == spender);
    }

    function _setApprovalForAll(
        address owner,
        address operator,
        bool approved
    ) internal virtual {
        require(
            owner != address(0),
            "ERC721: address zero is not a valid owner"
        );
        require(operator != address(0), "ERC721: approve to the zero address");
        require(owner != operator, "ERC721: approve to caller");
        _operatorApprovals[owner][operator] = approved;
        emit ApprovalForAll(owner, operator, approved);
    }

    function _checkAuthorized(
        address owner,
        address spender,
        uint256 tokenId
    ) internal view virtual {
        if (!_isAuthorized(owner, spender, tokenId)) {
            if (owner == address(0)) {
                revert("ERC721: nonexistent token");
            } else {
                revert("ERC721: caller is not token owner or approved");
            }
        }
    }

    function _increaseBalance(address account, uint128 value) internal virtual {
        unchecked {
            _balances[account] += value;
        }
    }

    function _update(
        address to,
        uint256 tokenId,
        address auth
    ) internal virtual returns (address) {
        address from = _ownerOf(tokenId);

        if (auth != address(0)) {
            _checkAuthorized(from, auth, tokenId);
        }

        if (from != address(0)) {
            _approve(address(0), tokenId, address(0), false);

            unchecked {
                _balances[from] -= 1;
            }
        }

        if (to != address(0)) {
            unchecked {
                _balances[to] += 1;
            }
        }

        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);

        return from;
    }

    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "ERC721: mint to the zero address");
        address previousOwner = _update(to, tokenId, address(0));
        require(previousOwner == address(0), "ERC721: token already minted");
    }

    function _safeMint(address to, uint256 tokenId) internal virtual {
        _safeMint(to, tokenId, "");
    }

    function _safeMint(
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual {
        _mint(to, tokenId);
        _checkOnERC721Received(address(0), to, tokenId, data);
    }

    function _burn(uint256 tokenId) internal virtual {
        address previousOwner = _update(address(0), tokenId, address(0));
        require(previousOwner != address(0), "ERC721: nonexistent token");
    }

    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        require(to != address(0), "ERC721: transfer to the zero address");
        address previousOwner = _update(to, tokenId, address(0));
        require(previousOwner == from, "ERC721: transfer from incorrect owner");
    }

    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual {
        _safeTransfer(from, to, tokenId, "");
    }

    function _safeTransfer(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) internal virtual {
        _transfer(from, to, tokenId);
        _checkOnERC721Received(from, to, tokenId, data);
    }

    function _approve(
        address to,
        uint256 tokenId,
        address auth
    ) internal virtual {
        _approve(to, tokenId, auth, true);
    }

    function _approve(
        address to,
        uint256 tokenId,
        address auth,
        bool emitEvent
    ) internal virtual {
        if (emitEvent || auth != address(0)) {
            address owner = _requireOwned(tokenId);

            if (auth != address(0)) {
                require(
                    owner == auth || isApprovedForAll(owner, auth),
                    "ERC721: approve caller is not token owner or approved for all"
                );
            }

            if (emitEvent) {
                emit Approval(owner, to, tokenId);
            }
        }

        _tokenApprovals[tokenId] = to;
    }

    function _requireOwned(uint256 tokenId) internal view returns (address) {
        address owner = _ownerOf(tokenId);
        require(owner != address(0), "ERC721: nonexistent token");
        return owner;
    }

    function _checkOnERC721Received(
        address from,
        address to,
        uint256 tokenId,
        bytes memory data
    ) private {
        if (to.code.length > 0) {
            try
                IERC721Receiver(to).onERC721Received(
                    msg.sender,
                    from,
                    tokenId,
                    data
                )
            returns (bytes4 retval) {
                if (retval != _ERC721_RECEIVED) {
                    revert(
                        "ERC721: transfer to non ERC721Receiver implementer"
                    );
                }
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert(
                        "ERC721: transfer to non ERC721Receiver implementer"
                    );
                } else {
                    /// @solidity memory-safe-assembly
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        }
    }
}
