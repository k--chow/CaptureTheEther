pragma solidity ^0.4.21;

// look at compiler warnings

contract TokenSaleChallenge2 {
    // not global! but public
    // variable shadowing?
    mapping(address => uint256) public balanceOf;
    // can I change the price? change public variables
    uint256 constant PRICE_PER_TOKEN = 1 ether;

    // why do we take address?
    // constructor warning here?
    // deploy two contracts?
    // or send it to yourself
    // can you edit constructor unused paramtere?
    function TokenSaleChallenge2(address _player) public payable {
        // require 1 ether put into the contract
        require(msg.value == 1 ether);
    }
    /*
    // call constructor with a different name?
    // try a different constructor
    function TokenSaleChallenge() public {
        balanceOf[msg.sender] = 100;
    }*/
    
    // view cannot modify state
    function isComplete() public view returns (bool) {
        return address(this).balance < 1 ether;
    }
    // not just overflowing msg.value but overflowing numToken*Price per token! I was gonnas send a billion lmoao
    // need to overflow to 0, or 1 or something
    function buy(uint256 numTokens) public payable {
        require(msg.value == numTokens * PRICE_PER_TOKEN);
        //price per token is 1 or 10^18? 
        // 10*10^18 
        // should also require an overflow here?

        balanceOf[msg.sender] += numTokens;
    }
    // try to overdraft
    // get balanceOf as greater
    function sell(uint256 numTokens) public {
        // must check boy
        require(balanceOf[msg.sender] >= numTokens);
        // update book keeping before transfer
        balanceOf[msg.sender] -= numTokens;
        // doesn't cost gas. gas only one time by sender
        // make someone selse pay?
        msg.sender.transfer(numTokens * PRICE_PER_TOKEN);
    }
    // decimal?
    function testFlow(uint256 num) public view returns (uint256) {
        return num*PRICE_PER_TOKEN;
    }
    
    // (num * 10^18) mod 2^256 = 2^256
    
    // 0 = 2^256
    
    // 11579208923731619542357098500868790785326998466564056403945758
    
    //115792089237316195423570985008687907853269984665640564039457 000...
    
    //115792089237316195423570985008687907853269984665640564039458
    
    //8 * 10^18 - 
    
    // 115792089237316195423570985008687907853269984665640564039457
    
    // 
    
    // last part: 584007913129639936
    
    // n*4 % 6 == 0. n ==12
}
