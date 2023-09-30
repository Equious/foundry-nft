//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNft} from "../script/DeployBasicNFT.s.sol";

contract BasicNFTTest is Test {
    DeployBasicNft public deployer;
    BasicNFT public basicNft;
    address public user = makeAddr("user");
    string public constant TOKENURI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public {
        string memory expected = "BasicNFT";
        string memory actual = basicNft.name();
        bytes memory actualEncoded = abi.encodePacked(actual);
        bytes memory expectedEncoded = abi.encodePacked(expected);
        assert(bytes32(actualEncoded) == bytes32(expectedEncoded));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(user);
        basicNft.mintNFT(TOKENURI);

        assert(basicNft.balanceOf(user) == 1);
        assert(basicNft.ownerOf(0) == user);
        assert(
            bytes32(abi.encodePacked(basicNft.tokenURI(0))) ==
                bytes32(abi.encodePacked(TOKENURI))
        );
    }
}
