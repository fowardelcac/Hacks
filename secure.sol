//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract secure {
    uint256 private another;
    bytes32 private _password;
    address private _owner;

    constructor() {
        _owner = msg.sender;
        another = 98765456789;
    }

    modifier onlyOwner() {
        require(msg.sender == _owner);
        _;
    }

    receive() external payable {}

    function setPassword(uint256 _pass) external onlyOwner {
        _password = keccak256(abi.encode(_pass));
    }

    function claim(uint256 _pass) public {
        bytes32 submittedHash = keccak256(abi.encodePacked(_pass));
        require(submittedHash == _password);
        payable(msg.sender).transfer(address(this).balance);
    }
}

/*
    tx = c.setPassword(12, {'from': accounts[0]})
    data = tx.input
    contract.decode_input(data)
    chain.get_transaction('0x7c62af664abf32c8187344d15ff809a447a53f197934c4e9e7f6e00558ed9840')

*/
