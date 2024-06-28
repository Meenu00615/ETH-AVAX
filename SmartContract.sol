// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract SmartContract {
    uint public num;  //num

    function Require(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function Revert(uint _i) public pure {
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    function Assert() public view {
        assert(num == 0);
    }

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }
}
