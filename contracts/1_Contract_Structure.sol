// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/*
   A contract can contain declarations of:
   1.State Variables -> State variables are variables whose values are permanently stored in contract storage.
   2.Functions  -> Functions are the executable units of code. Functions are usually defined inside a contract, but they can also be defined outside of contracts.
   3.Function Modifiers -> Function modifiers can be used to amend the semantics of functions in a declarative way.
   4.Events -> Events are convenience interfaces with the EVM logging facilities.
   5.Errors -> Errors allow you to define descriptive names and data for failure situations. Errors can be used in revert statements
   6.Struct Types -> Structs are custom defined types that can group several variables.
   7.Enum Types -> Enums can be used to create custom types with a finite set of ‘constant values
*/

contract ContractStructure {
    //State Variable: See 1
    address public creator;

    // Enum Type: See 7
    enum Day {
        FIRST,
        SECOND,
        THIRD
    }

    //Struct Type: See 6
    struct Creation {
        string name;
        string valuation;
    }

    //Constructor
    constructor() {
        creator = msg.sender;
    }

    //Event: See 4
    event CreatorCommand(Creation creation, string command);

    //Error : See 5
    error NotCreationDay(string msg);

    //Function modifier :  See 3
    modifier onlyCreator() {
        require(msg.sender == creator, "Only creator can call this.");
        _;
    }

    //Function: See 2.
    function create(Day day) public onlyCreator {
        if (day == Day.FIRST) {
            Creation memory creation = Creation("TradeShare", "23.2M");
            emit CreatorCommand(creation, "TradeShare Creation");
        } else if (day == Day.SECOND) {
            //
            Creation memory creation = Creation("SwingWI=izards", "100.8M");
            emit CreatorCommand(creation, "Swingwizards Creation");
        } else {
            //Show error using NotCreationDay
            revert NotCreationDay("Not creation Day");
        }
    }
}
