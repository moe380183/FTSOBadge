// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
import "./Pledge.sol";

contract PledgeFactory {
    address[] internal addresses;

    function makePledge(string memory pledgeString, uint chainId)
        public
        payable        
    {
        Pledge pledge;
        pledge = new Pledge(pledgeString, chainId);
        addresses.push(address(pledge));        
    }

    function getPledgeAddresses() public view returns (address[] memory) {
        return addresses;
    }
}
