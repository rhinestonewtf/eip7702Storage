// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { RDataStorage } from "./RDataStorage.sol";

/**
 * @title RData
 * @dev Library for storing and loading data from RDataStorage
 * using structs , since we can have 'storage' keyword in the function
 * signature and thus access .slot in assembly
 * @author rhinestone | zeroknots.eth
 */
library RData {
    struct Bytes32 {
        bytes32 b32;
    }

    struct Address {
        address addr;
    }

    struct Uint256 {
        uint256 u256;
    }

    struct Bool {
        bool boolean;
    }

    struct Int256 {
        int256 i256;
    }

    struct Bytes {
        bytes data;
    }

    struct String {
        string str;
    }

    // NOTE: right now expects that the storage contract is etched to the address
    // shall be replaced to prod address once on testnet / mainnet
    RDataStorage constant storageContract = RDataStorage(address(0x4411BBAA));

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                           Bytes32                          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
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

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                           Address                          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
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

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                           Integer                          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
    function store(Uint256 storage str, uint256 data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setUint(_slot, data);
    }

    function load(Uint256 storage str) internal view returns (uint256 value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getUint(_slot);
    }

    function store(Int256 storage str, int256 data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setInt(_slot, data);
    }

    function load(Int256 storage str) internal view returns (int256 value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getInt(_slot);
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                           Boolean                          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
    function store(Bool storage str, bool data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setBool(_slot, data);
    }

    function load(Bool storage str) internal view returns (bool value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getBool(_slot);
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                           Bytes                          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
    function store(Bytes storage str, bytes memory data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setBytes(_slot, data);
    }

    function load(Bytes storage str) internal view returns (bytes memory value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getBytes(_slot);
    }

    /*´:°•.°+.*•´.*:˚.°*.˚•´.°:°•.°•.*•´.*:˚.°*.˚•´.°:°•.°+.*•´.*:*/
    /*                           String                          */
    /*.•°:°.´+˚.*°.˚:*.´•*.+°.•°:´*.´•*.•°.•°:°.´:•˚°.*°.˚:*.´+°.•*/
    function store(String storage str, string memory data) internal {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        storageContract.setString(_slot, data);
    }

    function load(String storage str) internal view returns (string memory value) {
        bytes32 _slot;
        assembly {
            _slot := str.slot
        }
        value = storageContract.getString(_slot);
    }
}
