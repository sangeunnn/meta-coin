// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <0.9.0;

// These files are dynamically created at test time
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/MetaCoin.sol";

contract TestMetaCoin {
    function testInitialBalanceUsingDeployedContract() public {
        MetaCoin meta = MetaCoin(DeployedAddresses.MetaCoin());

        uint expected = 10000;

        Assert.equal(
            meta.getBalance(msg.sender),
            expected,
            "Owner should have 10000 MetaCoin initially"
        );
    }

    function testInitialBalanceWithNewMetaCoin() public {
        MetaCoin meta = new MetaCoin();

        uint expected = 10000;

        Assert.equal(
            meta.getBalance(msg.sender),
            expected,
            "Owner should have 10000 MetaCoin initially"
        );
    }
}
