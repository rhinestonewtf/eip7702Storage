// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import "src/EIP7702Storage.sol";

contract StorageTest is Test {
    using RData for RData.Address;
    using RData for RData.Bytes32;

    RDataStorage storageContract;

    mapping(address module => RData.Address) internal installedModule;

    function setUp() public virtual {
        storageContract = new RDataStorage();

        vm.etch(address(RData.storageContract), address(storageContract).code);
    }

    function test_store(address value) public {
        address module = makeAddr("module");
        installedModule[module].store(value);
        address _value = installedModule[module].load();

        assertEq(value, _value);
    }
}
