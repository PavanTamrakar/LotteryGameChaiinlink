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

    

}