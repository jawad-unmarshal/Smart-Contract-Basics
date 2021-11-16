// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract StarterHelloContract {
    string helloString;
    address owner;
    
    constructor (string memory _helloString){
        helloString = _helloString;
        owner = msg.sender;
    }
    
    function seeHelloString() public view returns(string memory) {
        return helloString;
    }
    
    function changeHelloString(string memory _helloString) external {
        helloString = _helloString;
    }
    
    struct User {
        address userAddress;
        string userName;
        string greeting;
    }
    mapping(address=>User) public userMap;
    
    function addGreeting(string memory userName, string memory greeting) external payable valueCheck returns (string memory)  {
        userMap[msg.sender] = newUser(msg.sender,userName, greeting);
        return greeting;
    }
    
    function newUser(address _userAddr, string memory _userName, string memory _greeting) internal pure returns(User memory) {
        User memory retUser;
        retUser.userAddress = _userAddr;
        retUser.userName = _userName;
        retUser.greeting = _greeting;
        return retUser;
    }

    modifier valueCheck() {
        require(
            msg.value >= 0.001 ether,
            "Amount is less than minimum"
            );
            _;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
     function ownerCollect() public payable {
        bool sent;
        (sent, ) = owner.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}