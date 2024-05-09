// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import "src/RDataStorage.sol";
import "src/RdataLib.sol";

contract StorageTest is Test {
    using RData for RData.Address;
    using RData for RData.Bytes32;

    RDataStorage storageContract;

    mapping(address module => RData.Address) internal addresses;
    mapping(address module => RData.Bytes32) internal bytes32s;

    function setUp() public virtual {
        storageContract = new RDataStorage();

        vm.etch(address(RData.storageContract), address(storageContract).code);
    }

    function test_address(address value) public returns (address _value) {
        address key = makeAddr("key");
        addresses[key].store(value);
        _value = addresses[key].load();

        assertEq(value, _value);
    }

    function test_bytes32(bytes32 value) public returns (bytes32 _value) {
        address key = makeAddr("key");
        bytes32s[key].store(value);
        _value = bytes32s[key].load();

        assertEq(value, _value);
    }

}
