// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./i.sol";

contract createCharity {
    uint256 public availableC = 0;
    address payable public contractAddress;
    address payable charityowner;
    mapping (uint => Charity) public charities;
 function createFund(address _charityowner, string memory _charityname, uint256 _requiredamount, string memory _funddescription, uint256 _minamount) public
 {
     charities[availableC] = new Charity(_charityowner, _charityname, _requiredamount, _funddescription, _minamount);
     availableC++;
 }

}