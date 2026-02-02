// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PlatoPosition {

    struct Position {
        uint256 startTime;
        bool active;
    }

    mapping(address => Position) public positions;

    function enter() external {
        require(!positions[msg.sender].active, "already active");
        positions[msg.sender] = Position({
            startTime: block.timestamp,
            active: true
        });
    }

    function exit() external {
        Position memory p = positions[msg.sender];
        require(p.active, "not active");
        require(block.timestamp > p.startTime + 30 days, "time lock");
        positions[msg.sender].active = false;
    }

    function elapsed(address user) external view returns (uint256) {
        if (!positions[user].active) return 0;
        return block.timestamp - positions[user].startTime;
    }
}
