// SPDX-License-Identifier: None

pragma solidity >=0.4.22 <0.8.0;

import './States.sol';

 /**
 * Products contract
 */
contract Products is States {

    event ProductAdded(string uuid, string name, string description,string manufacturer, string createdDate);

    event StateChanged(string productId, string title, string description, string createdDate);

    struct Product {
        string uuid;
        string name;
        string description;
        string manufacturer;
        string createdDate;
        string createdById;
        uint8 numStates;
        bool initialised;
        mapping (uint8 => State) states;
    }

    mapping (string => Product) productStore;

    /**
     * Adds new Product to contract
     *
     * Emits a {ProductAdded} event
     * Returns a boolean value indicating whether the operation succeeded.
     */
    function add(
        string memory _productId,
        string memory _name,
        string memory _description,
        string memory _manufacturer,
        string memory _createdDate,
        string memory _createdById
    ) internal returns (bool) {

        require(!productStore[_productId].initialised, 'Product already present with given ID');

        Product storage item = productStore[_productId];
        item.uuid = _productId;
        item.name = _name;
        item.description = _description;
        item.manufacturer = _manufacturer;
        item.createdDate = _createdDate;
        item.createdById = _createdById;
        item.numStates = 0;
        item.initialised = true;

        emit ProductAdded(_productId, _name, _description, _manufacturer, _createdDate);

        return true;
    }

    /**
     * Get product by product Id
     *
     * returns Product details
     */
    function getById(
        string memory _productId
    ) internal view returns (string memory, string memory, string memory, string memory, string memory) {

        require(productStore[_productId].initialised, 'Product not available!');

        Product storage item = productStore[_productId];

        return (item.uuid, item.name, item.description, item.manufacturer, item.createdDate);
    }

    /**
     * Change the state of Product
     *
     * Emits a {StateChanged} event
     * Returns a boolean value indicating whether the operation succeeded.
     */
    function changeState(
        string memory _productId,
        string memory _title,
        string memory _description,
        string memory _createdDate,
        string memory _createdById
    ) internal returns (bool) {

        require(productStore[_productId].initialised, 'Product not available!');

        Product storage product = productStore[_productId];

        State memory state = State({
            title: _title,
            description: _description,
            createdDate: _createdDate,
            createdById: _createdById
        });

        product.states[product.numStates] = state;
        product.numStates += 1;

        emit StateChanged(_productId, _title, _description, _createdDate);

        return true;
    }
}