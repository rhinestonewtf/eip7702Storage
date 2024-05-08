// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

contract Storage {
    struct Records {
        // Storage maps
        mapping(bytes32 => string) stringStorage;
        mapping(bytes32 => bytes) bytesStorage;
        mapping(bytes32 => uint256) uintStorage;
        mapping(bytes32 => int256) intStorage;
        mapping(bytes32 => address) addressStorage;
        mapping(bytes32 => bool) booleanStorage;
        mapping(bytes32 => bytes32) bytes32Storage;
    }

    mapping(address account => Records records) internal records;

    function getAddress(address account, bytes32 _key) external view returns (address r) {
        Records storage record = records[account];
        return record.addressStorage[_key];
    }

    function getUint(address account, bytes32 _key) external view returns (uint256 r) {
        Records storage record = records[account];
        return record.uintStorage[_key];
    }

    function getString(address account, bytes32 _key) external view returns (string memory) {
        Records storage record = records[account];
        return record.stringStorage[_key];
    }

    function getBytes(address account, bytes32 _key) external view returns (bytes memory) {
        Records storage record = records[account];
        return record.bytesStorage[_key];
    }

    function getBool(address account, bytes32 _key) external view returns (bool r) {
        Records storage record = records[account];
        return record.booleanStorage[_key];
    }

    function getInt(address account, bytes32 _key) external view returns (int256 r) {
        Records storage record = records[account];
        return record.intStorage[_key];
    }

    function getBytes32(address account, bytes32 _key) external view returns (bytes32 r) {
        Records storage record = records[account];
        return record.bytes32Storage[_key];
    }

    function setAddress(bytes32 _key, address _value) external {
        Records storage record = records[msg.sender];
        record.addressStorage[_key] = _value;
    }

    function setUint(bytes32 _key, uint256 _value) external {
        Records storage record = records[msg.sender];
        record.uintStorage[_key] = _value;
    }

    function setString(bytes32 _key, string calldata _value) external {
        Records storage record = records[msg.sender];
        record.stringStorage[_key] = _value;
    }

    function setBytes(bytes32 _key, bytes calldata _value) external {
        Records storage record = records[msg.sender];
        record.bytesStorage[_key] = _value;
    }

    function setBool(bytes32 _key, bool _value) external {
        Records storage record = records[msg.sender];
        record.booleanStorage[_key] = _value;
    }

    function setInt(bytes32 _key, int256 _value) external {
        Records storage record = records[msg.sender];
        record.intStorage[_key] = _value;
    }

    function setBytes32(bytes32 _key, bytes32 _value) external {
        Records storage record = records[msg.sender];
        record.bytes32Storage[_key] = _value;
    }

    function deleteAddress(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.addressStorage[_key];
    }

    function deleteUint(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.uintStorage[_key];
    }

    function deleteString(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.stringStorage[_key];
    }

    function deleteBytes(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.bytesStorage[_key];
    }

    function deleteBool(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.booleanStorage[_key];
    }

    function deleteInt(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.intStorage[_key];
    }

    function deleteBytes32(bytes32 _key) external {
        Records storage record = records[msg.sender];
        delete record.bytes32Storage[_key];
    }

    function addUint(bytes32 _key, uint256 _amount) external {
        Records storage record = records[msg.sender];
        record.uintStorage[_key] = record.uintStorage[_key].add(_amount);
    }

    function subUint(bytes32 _key, uint256 _amount) external {
        Records storage record = records[msg.sender];
        record.uintStorage[_key] = record.uintStorage[_key].sub(_amount);
    }
}
