//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721 {
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("BasicNFT", "BFT") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenURI) public returns (uint256) {
        uint256 newItemId = s_tokenCounter;
        s_tokenIdToUri[newItemId] = tokenURI;
        _safeMint(msg.sender, newItemId);
        //_setTokenURI(newItemId, tokenURI);
        s_tokenCounter = s_tokenCounter + 1;
        return newItemId;
    }

    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        // test URI: ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json
        return s_tokenIdToUri[tokenId];
    }
}
