pragma solidity ^0.4.21;

contract GuessTheSecretNumberChallenge {
    bytes32 answerHash = 0xdb81b4d58595fbbbb592d3661a34cdca14d7ab379441400cbfa1b78bc447c365;

    function GuessTheSecretNumberChallenge() public payable {
        require(msg.value == 1 ether);
    }
    
    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);

        if (keccak256(n) == answerHash) {
            msg.sender.transfer(2 ether);
        }
    }
    
    // write a function to loop from 0 to 255 and see if hash equals whatever
    function bruteForce() public view returns (uint8) {
        uint8 i;
        uint8 end = 255;
        for (i = 0; i<= end; i++) {
            if (keccak256(i) == answerHash) {
                return i;
            }
        }
        return i;
    }
}
