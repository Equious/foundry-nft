//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {console, Test} from "forge-std/Test.sol";
import {DeployMoodNFT} from "../script/DeployMoodNFT.s.sol";

contract MoodNFTTest is Test {
    DeployMoodNFT public deployer;

    function setUp() public {
        deployer = new DeployMoodNFT();
    }

    function testConvertSVGToImageURI() public {
        string
            memory expectedURI = "data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaWdodD0iNDAwIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxjaXJjbGUgY3g9IjEwMCIgY3k9IjEwMCIgZmlsbD0icHVycGxlIiByPSI3OCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIi8+CiAgPGcgY2xhc3M9ImV5ZXMiPgogICAgPGNpcmNsZSBjeD0iNjEiIGN5PSI4MiIgcj0iMjAiLz4KICAgIDxjaXJjbGUgY3g9IjEyNyIgY3k9IjgyIiByPSIxMiIvPgogIDwvZz4KICA8cGF0aCBkPSJtMTM2LjgxIDExNi41M2MuNjkgMjYuMTctLjExIDQyLTgxLjUyLS43MyIgc3R5bGU9ImZpbGw6bm9uZTsgc3Ryb2tlOiBibGFjazsgc3Ryb2tlLXdpZHRoOiA3OyIvPgo8L3N2Zz4=";
        string memory returnedURI = deployer.svgToImageURI(
            '<svg viewBox="0 0 200 200" width="400"  height="400" xmlns="http://www.w3.org/2000/svg"><circle cx="100" cy="100" fill="purple" r="78" stroke="black" stroke-width="3"/><g class="eyes"><circle cx="61" cy="82" r="20"/><circle cx="127" cy="82" r="12"/></g><path d="m136.81 116.53c.69 26.17-.11 42-81.52-.73" style="fill:none; stroke: black; stroke-width: 7;"/></svg>'
        );
        assert(
            bytes32(abi.encodePacked(returnedURI)) ==
                bytes32(abi.encodePacked(expectedURI))
        );
    }
}
