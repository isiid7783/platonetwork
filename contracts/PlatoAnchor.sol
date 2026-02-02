// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Plato Network Anchor Contract
Non-functional, immutable, non-interactive.
*/

contract PlatoAnchor {

    string public constant NAME = "Plato Network";

    string public constant PURPOSE =
        "A non-negotiable reference frame for judgment.";

    string public constant DEFINITION_HASH =
        "sha256(definition.txt stored off-chain)";
}
