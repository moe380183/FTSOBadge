// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Pledge.sol";

contract PledgeFactory {
    address[] internal addresses;

    function makePledge(string memory pledgeString)
        public
        payable
        returns (address)
    {
        Pledge pledge;
        pledge = new Pledge(pledgeString);
        addresses.push(address(pledge));
        return address(pledge);
    }

    function getPledgeAddresses() public view returns (address[] memory) {
        return addresses;
    }
}
