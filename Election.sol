// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.0;

contract Election {
    struct Candidate{
        uint id;
        string name;
        uint votecount;
    }

    uint public Candidatescount;

    mapping(uint =>Candidate) public candidates;
    mapping(address => bool) public votedornot;

    event electionupdated
    (
        uint id,
        string name,
        uint votecount 
    );

    constructor   (){

        addCandidate("Ramesh Gandhi");
        addCandidate("Devendra Modi");
        
    }
     function addCandidate (string memory name) public
      {
         Candidatescount ++;
         candidates[Candidatescount] =Candidate(Candidatescount, name,0);       
      }
     function vote (uint _id) public 
     {
       
        require(!votedornot[msg.sender],"You have voted for the participant");

       
       require(candidates[_id].id !=0,"The id doesnt exist");

       candidates[_id].votecount+=1;

       votedornot[msg.sender]=false;
       
       emit electionupdated(_id,candidates[_id].name,candidates[_id].votecount);

        
        
     }

}
