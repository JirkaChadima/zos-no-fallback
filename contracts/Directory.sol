pragma solidity ^0.5.6;

import "zos-lib/contracts/Initializable.sol";
import "zos-lib/contracts/application/App.sol";

contract Directory is Initializable {

    App internal app;

    // Address of the contract owner
    address _owner;

    address[] _organizations;

    event OrganizationCreated(address indexed organization);

    function initialize(address payable __owner,App _app) public initializer {
        _owner = __owner;
        app = _app;
    }

    function createOrganization(string memory dataUri) internal returns (address) {
        address newOrganizationAddress = address(
            app.create(
                "zos-repro-repo", 
                "Organization", 
                _owner, 
                abi.encodeWithSignature("initialize(address,string)", msg.sender, dataUri)
            )
        );
        emit OrganizationCreated(newOrganizationAddress);
        _organizations.push(newOrganizationAddress);
        return newOrganizationAddress;
    }

    function create(string calldata dataUri) external returns (address) {
        return createOrganization(dataUri);
    }

    function getOrganizations() public view returns (address[] memory) {
        return _organizations;
    }
}
