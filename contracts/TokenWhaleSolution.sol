pragma solidity ^0.4.21;

interface IName {
    function approve(address spender, uint256 value) public;
}

contract TokenWhaleSolution {
    address watch_addr = 0x601E749eED9def332E6d814b233eca7B400D1342;
    function approve2(address spender, uint256 value) public {
        IName(watch_addr).approve(spender, value);
    }
}