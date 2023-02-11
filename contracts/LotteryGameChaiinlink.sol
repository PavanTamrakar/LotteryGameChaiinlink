// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract LotteryGameChaiinlink is VRFConsumerBase, Ownable {
    uint256 public fee;
    bytes32 public keyHash;

    address[] public players;

    bool public gameStarted;

    uint8 maxPlayer;

    uint256 public entryFee;

    uint256 public gameId;

    event GameStarted (uint8 maxPlayer, uint256 entryFee, uint256 gameId);

    event PlayerJoined (uint256 gameId, address players);

    event GameEnded (uint256 gameID, address winner, bytes32 requestId);

    constructor (address vrfCoordinator, address linkToken, bytes32 vrfKeyHash, uint256 vrfFee)
    VRFConsumerBase(vrfCoordinator, linkToken) {
        keyHash = vrfKeyHash;
        fee = vrfFee;
        gameStarted = false;
    }

    function startGame(uint8 _maxPlayer, uint256 _entryFee) public onlyOwner{
        require(!gameStarted, "Game already Started");
        delete players;

        maxPlayer = _maxPlayer;

        gameStarted = true;

        entryFee = _entryFee;

        gameId += 1;

        emit GameStarted(maxPlayer, entryFee, gameId);
    }
}