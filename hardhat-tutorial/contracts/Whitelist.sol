//SPDX-License-Identifier: Unlicenced

pragma solidity ^0.8.0;

contract Whitelist {
    //Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Create mapping of whitelisted addresses
    // if an address is whitelisted, we would set it to true, false by default for all other addresss
    mapping(address => bool) public whitelistedAddresses;

    //numAddressWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Dont' change this variable name as it is part of verification
    uint8 public numAddressesWhitelisted;

    //Setting the Max number of whitelisted addresses
    //User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //this function adds the address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // check if user is whitelisted
        require(
            !whitelistedAddresses[msg.sender],
            "Sender has already been whitelisted"
        );
        // check if numAddressesWhitelisted < maxWhitelistedAddresses, if not throw error
        require(
            numAddressesWhitelisted < maxWhitelistedAddresses,
            "Limit reached"
        );
        //Add address which called function to whitelist array
        whitelistedAddresses[msg.sender] = true;
        //increase number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}
