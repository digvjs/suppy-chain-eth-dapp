// SPDX-License-Identifier: None

pragma solidity >=0.4.22 <0.8.0;

import './Products.sol';

/**
 * SupplyChain contract for tracking product
 *
 */
contract SupplyChain is Products {

    address public owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    constructor () public {
        owner = msg.sender;
    }

    /**
     * Adds new Product to contract
     *
     */
    function addProduct(string memory _productId, string memory _name, string memory _description, string memory _manufacturer,
        string memory _createdDate, string memory _createdById) public onlyOwner returns (bool) {

        return Products.add(_productId, _name, _description, _manufacturer, _createdDate, _createdById);
    }

    /**
     * Get product by product Id
     *
     */
    function getProduct(string memory _productId) public view returns
        (string memory, string memory, string memory, string memory, string memory) {

        return Products.getById(_productId);
    }

    /**
     * Change the state of Product
     *
     */
    function changeProductState(string memory _productId, string memory _title, string memory _description, string memory _createdDate,
        string memory _createdById) public onlyOwner returns (bool) {

        return Products.changeState(_productId, _title, _description, _createdDate, _createdById);
    }
}