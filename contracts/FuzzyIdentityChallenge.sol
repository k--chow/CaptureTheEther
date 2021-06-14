pragma solidity ^0.4.21;
// have a look where it's calling?
interface IName {
    function name() external view returns (bytes32);
}

// can your interface change a public variable?

//IName not even implemented!

// use contract to call! Want to get my own address as the guy is the point.
contract FuzzyIdentityChallengeSolution {
    function name() external view returns (bytes32) {
        return bytes32("smarx");
    }
    
    //function to call authenticate
}

contract FuzzyIdentityChallenge {
    bool public isComplete;

    function authenticate() public {
        require(isSmarx(msg.sender));
        require(isBadCode(msg.sender));

        isComplete = true;
    }
    
    function isSmarxTest(address addr) public view returns (bytes32) {
        //contract address or what?
        return IName(addr).name();
    }
    //internal function!
    function isSmarx(address addr) public view returns (bool) {
        //contract address or what?
        //think it's been taken. Just find the address. a wallet contract is deployed somewhere?
        // why can't I call my own then, even if he uses his?
        return IName(addr).name() == bytes32("smarx");
    }
    
    function isBadCodeTest(address _addr) public pure returns (bool) {
        return false;
    }
    // make this guy badcode some how
    // these are internal functions actually
    // can you search all contracts with certain names in it?
    function isBadCode(address _addr) public pure returns (bool) {
        //why are you bytes20 and not bytes32?
        // any part of addr needs to have badc0de
        bytes20 addr = bytes20(_addr); //bytes20 fucks up addr. Nope.
        bytes20 id = hex"000000000000000000000000000000000badc0de"; //hex adds 0x
        bytes20 mask = hex"000000000000000000000000000000000fffffff";
        
        //both length 20. How is it 20?
        // is this fucked?
        for (uint256 i = 0; i < 34; i++) {
            if (addr & mask == id) {
                return true;
            }
            mask <<= 4;
            id <<= 4;
        }

        return false;
    }
}