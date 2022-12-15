// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract tdoc {
    uint256 public someNumber;
    address public someAddress;
    mapping (uint256 => address) public someMapping;

    function setNum(uint256 _aNum, address _aAddress) public {
        someNumber = _aNum;
        someAddress = _aAddress;
        someMapping[someNumber] = someAddress;
    }

    function pay() external payable {
        someNumber = msg.value;
        someAddress = msg.sender;
        someMapping[0] = msg.sender;
    }

    function letsPayUser() public payable {
        // address(this).balance ---> the account balance
        payable(someAddress).transfer(someNumber);
    }
}
