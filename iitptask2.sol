//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
contract Task2 
{
    struct UserInfo 
    {
        address userAddress;
        string name;
    }
    mapping(address=>UserInfo)private users;
    address[] private userAddresses;
    uint256 public minDeposit=0.01 ether;

    function deposit(string memory name) public payable 
    {
        require(msg.value>=minDeposit,"Insufficient Deposit Amount");
        UserInfo storage newUser=users[msg.sender];
        newUser.userAddress=msg.sender;
        newUser.name=name;
        if (users[msg.sender].userAddress==address(0))
            userAddresses.push(msg.sender);
    }
    function getUserCount() public view returns(uint256) 
       { 
           return userAddresses.length;
       }
    function getUserInfo(uint256 index) public view returns(address, string memory) 
    {
        require(index<userAddresses.length,"Invalid Index");
        address userAddress=userAddresses[index];
        UserInfo memory userInfo=users[userAddress];
        return (userInfo.userAddress,userInfo.name);
    }
}
