// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Functions {
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    /*
         View functions? - Functions can be declared view in which case they promise not to modify the state.
         Functions are considered to  modify state if:
         1.Writing to state variables.
         2.Emitting events.
         3.Creating other contracts.
         4.Using selfdestruct.
         5.Sending Ether via calls.
         6.Calling any function not marked view or pure.
         7.Using low-level calls.
         8.Using inline assembly that contains certain opcodes.

     */

    function f(uint256 a, uint256 b) public view returns (uint256) {
        return a * (b + 42) + block.timestamp;
    }

    /*
        Pure Functions ?- Functions can be declared pure in which case they promise not to read from or modify the state.
        In addition to the list of state modifying statements explained above, the following are considered reading from the state:
        Reading from state variables.
        Accessing address(this).balance or <address>.balance.
        Accessing any of the members of block, tx, msg (with the exception of msg.sig and msg.data).
        Calling any function not marked pure.
        Using inline assembly that contains certain opcodes.      
   */
    function calculateSum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    /*
      What are function modifiers?
      -> Function modifiers can be used to change the behaviour of a function declaratively.They can be used to do conditional checks before executing 
         a function.
    */

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        _;
    }

    /*
       Payable ?
       This is called whenever  a call is made to the contract with empty calldata.
       This is the function that is executed on plain Ether transfers (e.g. via .send() or .transfer()).
       If no such function exists, but a payable fallback function exists, the fallback function will be called on a plain Ether transfer.
       If neither a receive Ether nor a payable fallback function is present, the contract cannot receive Ether through a transaction that does not represent a payable function call and throws an exception

   */

    receive() external payable {}
}

// This contract inherits the `onlyOwner` modifier from
// the `Functions` contract. As a result, calls to `changePrice` will
// only take effect if they are made by the stored owner.

contract Register is Functions {
    function registerUser() public onlyOwner {}
}
