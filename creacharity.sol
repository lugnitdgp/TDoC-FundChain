// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;
import "./importer.sol";

contract createCharity{
    uint256 public availableContracts = 0;
    mapping(uint256 => charity) public charities;

    function createFund(address payable  _charityowner,string memory _charityname,uint256 _requiredamount,string memory _fundescription,uint256 _minamount) public
    {
        charities[availableContracts] = new charity (_charityowner , _charityname, _requiredamount , _fundescription , _minamount);
        availableContracts++;
    }
}
