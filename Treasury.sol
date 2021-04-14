// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.6.0;

contract TreasuryVault {

    address treasury;
    uint funds;
    bool accessed;

    constructor() public payable {
        treasury = msg.sender;
        funds = msg.value;
        accessed = false;

    }

    modifier onlyOwner {
        require (msg.sender == treasury);
        _;

    }

    modifier requireAccess {
        require (accessed == true);
        _;

    }

    address payable[] treasuryWallet;

    mapping (address => uint) _funds;

    function setWithdrawal(address payable wallet, uint treasuryAmount) public onlyOwner {
        treasuryWallet.push(wallet);
        _funds[wallet] = treasuryAmount;
    }

    function payout() private requireAccess {
        for (uint i = 0; i < treasuryWallet.length; i++) {
            treasuryWallet[i].transfer(_funds[treasuryWallet[i]]);
        }
    }

    function grantAccess() public onlyOwner {
        accessed = true;
        payout();
    }
}
