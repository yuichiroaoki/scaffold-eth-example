//SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

import "hardhat/console.sol";
//import "@openzeppelin/contracts/access/Ownable.sol"; //https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract YourContract {

  event SetPurpose(address sender, string purpose);
  AggregatorV3Interface internal priceFeed;

  /**
    * Network: Kovan
    * Aggregator: ETH/USD
    * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
    */

  string public purpose = "Building Unstoppable Apps";

  constructor() {
      priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
  }

  function setPurpose(string memory newPurpose) public {
    purpose = newPurpose;
    console.log(msg.sender,"set purpose to",purpose);
    emit SetPurpose(msg.sender, purpose);
  }

  function getThePrice() public view returns (int) {
      (
          uint80 roundID, 
          int price,
          uint startedAt,
          uint timeStamp,
          uint80 answeredInRound
      ) = priceFeed.latestRoundData();
      return price;
  }

}