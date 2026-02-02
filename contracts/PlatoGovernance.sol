// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PlatoGovernance {

    mapping(address => bool) public eligible;
    uint256 public proposalCount;

    struct Proposal {
        uint256 yes;
        uint256 no;
        bool closed;
    }

    mapping(uint256 => Proposal) public proposals;

    function register(address user) external {
        eligible[user] = true;
    }

    function createProposal() external returns (uint256) {
        proposalCount++;
        proposals[proposalCount] = Proposal(0,0,false);
        return proposalCount;
    }

    function vote(uint256 id, bool support) external {
        require(eligible[msg.sender], "not eligible");
        Proposal storage p = proposals[id];
        require(!p.closed, "closed");
        if (support) p.yes++;
        else p.no++;
    }

    function close(uint256 id) external {
        proposals[id].closed = true;
    }
}
