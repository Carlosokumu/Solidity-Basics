// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
   Events? :
    Events give an abstraction on top of the EVM’s logging functionality. 
    Applications can subscribe and listen to these events through the RPC interface of an Ethereum client.

    Indexed Parameters?:
    Events can have up to three indexed parameters, which makes it easier to search for specific events.
*/
contract Events {
    event Deposit(address indexed from, bytes32 indexed id, uint256 value);

    function deposit(bytes32 id) public payable {
        // Events are emitted using `emit`, followed by
        // the name of the event and the arguments
        // (if any) in parentheses. Any such invocation
        // (even deeply nested) can be detected from
        // the JavaScript API by filtering for `Deposit`.
        emit Deposit(msg.sender, id, msg.value);
    }
}
