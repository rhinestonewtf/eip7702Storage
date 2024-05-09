// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/**
 * @title RDataStorage
 * External storage contract to allow EOAs to store data when using EIP7702
 * @author rhinestone | zeroknots.eth
 */
contract RDataStorage {
    mapping(bytes32 key => mapping(address account => string value)) public stringStorage;
    mapping(bytes32 key => mapping(address account => bytes value)) public bytesStorage;
    mapping(bytes32 key => mapping(address account => uint256 value)) public uintStorage;
    mapping(bytes32 key => mapping(address account => int256 value)) public intStorage;
    mapping(bytes32 key => mapping(address account => address value)) public addressStorage;
    mapping(bytes32 key => mapping(address account => bool value)) public booleanStorage;
    mapping(bytes32 key => mapping(address account => bytes32 value)) public bytes32Storage;

    function getAddress(bytes32 _key) external view returns (address r) {
        return addressStorage[_key][msg.sender];
    }

    function getUint(bytes32 _key) external view returns (uint256 r) {
        return uintStorage[_key][msg.sender];
    }

    function getString(bytes32 _key) external view returns (string memory) {
        return stringStorage[_key][msg.sender];
    }

    function getBytes(bytes32 _key) external view returns (bytes memory) {
        return bytesStorage[_key][msg.sender];
    }

    function getBool(bytes32 _key) external view returns (bool r) {
        return booleanStorage[_key][msg.sender];
    }

    function getInt(bytes32 _key) external view returns (int256 r) {
        return intStorage[_key][msg.sender];
    }

    function getBytes32(bytes32 _key) external view returns (bytes32 r) {
        return bytes32Storage[_key][msg.sender];
    }

    function setAddress(bytes32 _key, address _value) external {
        addressStorage[_key][msg.sender] = _value;
    }

    function setUint(bytes32 _key, uint256 _value) external {
        uintStorage[_key][msg.sender] = _value;
    }

    function setString(bytes32 _key, string calldata _value) external {
        stringStorage[_key][msg.sender] = _value;
    }

    function setBytes(bytes32 _key, bytes calldata _value) external {
        bytesStorage[_key][msg.sender] = _value;
    }

    function setBool(bytes32 _key, bool _value) external {
        booleanStorage[_key][msg.sender] = _value;
    }

    function setInt(bytes32 _key, int256 _value) external {
        intStorage[_key][msg.sender] = _value;
    }

    function setBytes32(bytes32 _key, bytes32 _value) external {
        bytes32Storage[_key][msg.sender] = _value;
    }

    function deleteAddress(bytes32 _key) external {
        delete addressStorage[_key][msg.sender];
    }

    function deleteUint(bytes32 _key) external {
        delete uintStorage[_key][msg.sender];
    }

    function deleteString(bytes32 _key) external {
        delete stringStorage[_key][msg.sender];
    }

    function deleteBytes(bytes32 _key) external {
        delete bytesStorage[_key][msg.sender];
    }

    function deleteBool(bytes32 _key) external {
        delete booleanStorage[_key][msg.sender];
    }

    function deleteInt(bytes32 _key) external {
        delete intStorage[_key][msg.sender];
    }

    function deleteBytes32(bytes32 _key) external {
        delete bytes32Storage[_key][msg.sender];
    }
}
