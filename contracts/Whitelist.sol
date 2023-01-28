// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract Whitelist {
    //max number of addresses which can be whitelisted
    uint8 public maxWhiteListedAddresses;

    //keep track of number of addresses whitelisted till now
    uint8 public numAddressesWhiteListed;

    mapping(address => bool) public WhiteListedAddresses;

    constructor(uint8 _maxWhiteListedAddresses) {
        maxWhiteListedAddresses = _maxWhiteListedAddresses;
    }

    function addAddressToWhiteList() public {
        require(
            !WhiteListedAddresses[msg.sender],
            "sender already in whitelist"
        );
        require(
            numAddressesWhiteListed < maxWhiteListedAddresses,
            "Max limit reached"
        );
        WhiteListedAddresses[msg.sender] = true;
        numAddressesWhiteListed += 1;
    }
}
