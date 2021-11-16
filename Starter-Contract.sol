// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract StarterHelloContract {
    string HelloString;
    
    constructor (string memory _helloString) {
        HelloString = _helloString;
    }
    
    function seeHelloString() public view returns(string memory) {
        return HelloString;
    }
    
    function changeHelloString(string memory _helloString) external {
        HelloString = _helloString;
    }
}