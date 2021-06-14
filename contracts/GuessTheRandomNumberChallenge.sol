pragma solidity ^0.4.21;

contract GuessTheRandomNumberChallenge {
    uint8 answer;
    uint nownow;

    function GuessTheRandomNumberChallenge() public payable {
        require(msg.value == 1 ether);
        nownow = now;
        answer = uint8(keccak256(block.blockhash(block.number - 1), nownow));
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
    
    function getNow() public view returns (uint) {
        // get now, which is UTC probably
        return nownow;
    }
    
    function getBlockNum() public view returns (uint) {
        uint blockNum = block.number;
        return blockNum;
    }
    
    function getBlockHash(uint blockNum) public view returns (bytes32) {
        bytes32 hasher = block.blockhash(blockNum-1);
        return hasher;
    }
    
    
    function bruteForce(bytes32 blockHash, uint thisNow) public view returns (uint8) {
        uint8 i;
        // blockNum = 10356500 
        // (block.blockhash(blockNum-1), now)
        i = uint8(keccak256(blockHash, thisNow));
        return i;
    }
}
