// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Pledge {
    string public pl; //the pledge itself, could be a URL or IPFS link?
    int public importanceCount = 0;    //this is how important the pledge is, the more that subscriber this count increments
    mapping(address => uint) public subscribersStorage; //this holds the subscribers mapped to their whitelist
    address[] public subscribers ; //a list of sibscribers

    constructor(string memory pledge) {
        pl = pledge;
    }
    

    function subscribe(address subscriberAddress) public {            
            require(subscribersStorage[subscriberAddress] == 0, "Subscriber is already set");  //prevents same address subscribing
            subscribersStorage[subscriberAddress] = 1; //asking to subscribe    
            subscribers.push(subscriberAddress);
            importanceCount = importanceCount + 1; //importance count incremented - higher the count more important the pledge
        
    }
        
    function getSubscriberStatus(address subscriberAddress) public view returns (uint) {
        return subscribersStorage[subscriberAddress];
    }

    function sinbinSubscriber(address addressSinbin) public {
        //this would need to be secured to sinbin subscribers
        require(subscribersStorage[addressSinbin] == 1 
                || subscribersStorage[addressSinbin] == 2, "Subscriber must be new or whitelisted");
        subscribersStorage[addressSinbin] = 3; //requirements not met
    }
    
    function whitelistSubscriber(address addressWhitelist) public {
        //this would need to be secured to whitelist subscribers
        require(subscribersStorage[addressWhitelist] == 1 
                || subscribersStorage[addressWhitelist] == 3, "Subscriber must be new or in sin bin");
        subscribersStorage[addressWhitelist] = 2; //requirements met
    }    

    function getSubscribers() public view returns (address[] memory) {
        //this would need to be secured to sinbin subscribers
        return subscribers;
    }
}
