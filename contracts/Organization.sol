pragma solidity ^0.5.6;

import "zos-lib/contracts/Initializable.sol";

/**
 * @title Organization
 * @dev A contract that represents an Organization in the Winding Tree platform.
 */
contract Organization is Initializable {
    // Address of the contract owner
    address _owner;

    // Arbitrary locator of the off-chain stored Organization data
    // This might be an HTTPS resource, IPFS hash, Swarm address...
    // This is intentionally generic.
    string public dataUri;

    // Number of a block when the Organization was created
    uint public created;

    /**
     * @dev Event triggered when owner of the organization is changed.
     */
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Event triggered when dataUri of the organization is changed.
     */
    event DataUriChanged(string indexed previousDataUri, string indexed newDataUri);

    /**
     * @dev Initializer for upgradeable contracts.
     * @param __owner The address of the contract owner
     * @param _dataUri pointer to Organization data
     */
    function initialize(address payable __owner, string memory _dataUri) public initializer {
        require(__owner != address(0), 'Cannot set owner to 0x0 address');
        require(bytes(_dataUri).length != 0, 'dataUri cannot be an empty string');
        emit OwnershipTransferred(_owner, __owner);
        _owner = __owner;        
        dataUri = _dataUri;
        created = block.number;
    }

    /**
     * @dev Returns current dataUri
     * @return {" ": "Current dataUri."}
     */
    function getDataUri() external view returns (string memory) {
        return dataUri;
    }
}
