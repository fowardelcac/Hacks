//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract secure {
    bytes32 private _password;
    address private _owner;

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    receive() external payable {}
    
    function setPassword(uint256 _password) external onlyOwner {
        _password = keccak256(abi.encode(_password));
    }
    function claim(uint256 _pass) public {
        bytes32 submittedHash = keccak256(abi.encodePacked(_pass));
        require(submittedHash == _password, "Wrong password");
        payable(msg.sender).transfer(address(this).balance);
    }

}
