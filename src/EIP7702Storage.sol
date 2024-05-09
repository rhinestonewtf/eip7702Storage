// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

library RData {
    struct Bytes32 {
        bytes32 b32;
    }

    struct Address {
        address addr;
    }

    RDataStorage constant storageContract = RDataStorage(address(0x4411BBAA));

    function store(Bytes32 storage str, bytes32 data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setBytes32(_slot, data);
    }

    function load(Bytes32 storage str) internal view returns (bytes32 value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getBytes32(_slot);
    }

    function store(Address storage str, address data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setAddress(_slot, data);
    }

    function load(Address storage str) internal view returns (address value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getAddress(_slot);
    }
}

contract RDataStorage {
    mapping(bytes32 => mapping(address account => string)) internal stringStorage;
    mapping(bytes32 => mapping(address account => bytes)) internal bytesStorage;
    mapping(bytes32 => mapping(address account => uint256)) internal uintStorage;
    mapping(bytes32 => mapping(address account => int256)) internal intStorage;
    mapping(bytes32 => mapping(address account => address)) internal addressStorage;
    mapping(bytes32 => mapping(address account => bool)) internal booleanStorage;
    mapping(bytes32 => mapping(address account => bytes32)) internal bytes32Storage;

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
