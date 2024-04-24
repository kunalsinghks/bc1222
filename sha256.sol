// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HashConverter {
    function textToHash(string memory _text) public pure returns (bytes32) {
        return sha256(abi.encodePacked(_text));
    }
}


# real estate

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RealEstate {
    // Structure to represent a property
    struct Property {
        address owner;
        string location;
        uint256 price;
        bool isForSale;
    }

    // Mapping to store properties using a unique property ID
    mapping(uint256 => Property) public properties;

    // Event to emit when a new property is registered
    event PropertyRegistered(uint256 indexed propertyId, address indexed owner, string location, uint256 price);

    // Modifier to check if the caller is the owner of a property
    modifier onlyOwner(uint256 propertyId) {
        require(properties[propertyId].owner == msg.sender, "Only property owner can call this function");
        _;
    }

    // Function to register a new property
    function registerProperty(uint256 propertyId, string memory location, uint256 price) external {
        require(properties[propertyId].owner == address(0), "Property ID already exists");

        properties[propertyId] = Property({
            owner: msg.sender,
            location: location,
            price: price,
            isForSale: true
        });

        emit PropertyRegistered(propertyId, msg.sender, location, price);
    }

    // Function to get property details
    function getPropertyDetails(uint256 propertyId) external view returns (address owner, string memory location, uint256 price, bool isForSale) {
        Property storage property = properties[propertyId];
        return (property.owner, property.location, property.price, property.isForSale);
    }

    // Function to update property price
    function updatePrice(uint256 propertyId, uint256 newPrice) external onlyOwner(propertyId) {
        properties[propertyId].price = newPrice;
    }

    // Function to mark property as sold
    function markAsSold(uint256 propertyId) external onlyOwner(propertyId) {
        properties[propertyId].isForSale = false;
    }
}





#erc20


