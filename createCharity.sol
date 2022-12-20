// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./importer.sol";

contract createCharity {
    uint256 public availabeContracts=0;
    mapping (uint256 =>Charity) public charities;

    function createFund (
        address  _charityowner,
    string memory _charityname,
        uint256 _requiredamount,
        string memory _funddescription,
        uint256 _minamount
        ) public {
            charities[availabeContracts]= new Charity (payable (_charityowner),_charityname,_requiredamount,_funddescription,_minamount);
            availabeContracts++;
        }
}