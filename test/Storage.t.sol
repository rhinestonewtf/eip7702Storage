// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import "forge-std/Test.sol";
import "src/EIP7702Storage.sol";

struct Data {
    address module;
}

library AccessTest {
    function enableModule(Data storage data, EIP7702Storage storageContract, address module)
        internal
        returns (bytes32 slot)
    {
        assembly {
            slot := data.slot
        }
        storageContract.setAddress(slot, module);
    }
}

contract StorageTest is Test {
    EIP7702Storage storageContract;
    mapping(address module => Data) enabled;

    function setUp() public {
        storageContract = new EIP7702Storage();
    }
}
