// SPDX-License-Identifier : MIT
pragma solidity ^0.8.7;
contract charity{
    address payable public charityOwner;
    string public charityName;
    uint256 public requiredAmount;
    string public description;
    uint256 public minAmount;
    uint256 public amoountCollected;
    string [] public tags;
    bool public isOpen;
    address [] public donors;
    uint256 public noOfDonors;
    constructor(address payable _charityowner,string memory _charityname,uint256 _requiredamount,string memory _fundescription,uint256 _minamount){
        charityOwner=_charityowner;
        charityName=_charityname;
        requiredAmount=_requiredamount;
        description=_fundescription;
        minAmount+_minamount;
        tags= new string[] (0);
        isOpen=true;
        donors=new address[] (0);
        amoountCollected=0;
    }
    
    function pay() external payable{
        if(msg.value < minAmount)
        {
            revert();
        }
        if(isOpen != true){
            revert();
        }
        amoountCollected+=msg.value;
        donors.push(msg.sender);
        if(amoountCollected >= requiredAmount){
            isOpen=false;
            charityOwner.transfer(address(this).balance);
        }

    }
    function getCollectionPercentage() public view returns (uint256){
        return((amoountCollected/requiredAmount)*100);
    }
    function addTags(string[] memory _s) public{
        for(uint256 i=0;i<_s.length;i++){
            tags.push(_s[i]);
        }
    }
}