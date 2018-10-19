pragma solidity ^0.4.10;

contract Math {

    function sum(uint n) returns (uint) {
        uint s = 0;
        for (uint i = 1; i <= n; i++) {
            s += i;
        }
        return s;
    }
}
