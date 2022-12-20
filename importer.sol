// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract Charity {
    address payable public charityOwner;
    string public charityName;
    uint256 public requiredAmount;
    string public description;
    uint256 public minAmount;
    uint256 public amountCollected;
    string [] public tags;
    bool public isOpen;
    address [] public doners;
    uint256 public noofDoners;

    constructor (
        address payable _charityowner,
        string memory _charityname,
        uint256 _requiredamount,
        string memory _funddescription,
        uint256 _minamount
    ) {
        charityOwner= (_charityowner);
        charityName=_charityname;
        requiredAmount=_requiredamount;
        description=_funddescription;
        minAmount=_minamount;
        tags= new string[] (0);
        isOpen = true;
        noofDoners = 0 ;
        doners = new address[] (0);
        amountCollected = 0;
    }

    function pay() external payable {
        if (msg.value < minAmount) {
            revert();
        }
        if (isOpen!= true) {
            revert();
        }
        if(msg.sender==charityOwner) {
            amountCollected+=0;

        }
        else {
            amountCollected += msg.value;
            bool flag=true;
            for(uint256 i=0;i<doners.length;i++ ) {
                if(msg.sender==doners[i]) {
                    flag=false;
                }
            }
            if (flag==true) {
             doners.push(msg.sender);
            } 
        }
        if (amountCollected>= requiredAmount) {
            isOpen = false;
            charityOwner.transfer(address(this).balance);
        }
    }


    function getCollectionPersentage() public view returns (uint256) {
        return ((amountCollected*100)/requiredAmount);
    }

    function addTags (string[] memory _s) public {
        for (uint256 i=0;i<_s.length;i++) {
            tags.push(_s[i]);
        }
    }

    function withdraw() external payable {
        payable(charityOwner).transfer(address(this).balance);
        isOpen=false;
    }









}