contract SimplePay{

    struct donatorInfo{
        uint totalDonated;
        uint lastDonated;
    }

    mapping(address => donatorInfo) donator;

    uint public contractBalance;
    uint public totalDonations;

    constructor() public{
        contractBalance = 0;
        totalDonations = 0;
    }

    function payToContract() public payable returns(uint){
        contractBalance = contractBalance + msg.value;
        donator[msg.sender].totalDonated = donator[msg.sender].totalDonated + msg.value;
        donator[msg.sender].lastDonated = msg.value;
        return msg.value;
    }
}