pragma solidity ^0.5.0;

contract Auction {
    address payable public beneficiary;

    // Current state of the auction. You can create more variables if needed
    address public highestBidder;
    uint public highestBid;
    bool public auctionEndFlag;

    // Allowed withdrawals of previous bids
    mapping(address => uint) pendingReturns;

    // Constructor
    constructor() public {
        beneficiary = msg.sender;
        auctionEndFlag = false;
    }

    /// Bid on the auction with the value sent
    /// together with this transaction.
    /// The value will only be refunded if the
    /// auction is not won.
    function bid() public payable {


        // TODO If the bid is not higher than highestBid, send the
        // money back. Use "require"
        
        // TODO update state

        // TODO store the previously highest bid in pendingReturns. That bidder
        // will need to trigger withdraw() to get the money back.
        // For example, A bids 5 ETH. Then, B bids 6 ETH and becomes the highest bidder. 
        // Store A and 5 ETH in pendingReturns. 
        // A will need to trigger withdraw() later to get that 5 ETH back.

        // Sending back the money by simply using
        // highestBidder.send(highestBid) is a security risk
        // because it could execute an untrusted contract.
        // It is always safer to let the recipients
        // withdraw their money themselves.
        require(!auctionEndFlag,"Cannot Bid, Auction has ended!");
        require(msg.value > highestBid, "Cannot proceed, Please make a higher bid");
        require(msg.sender!=highestBidder,"Cannot Bid, You already have the highest bid");

        if(highestBid!=0)
        {
            pendingReturns[highestBidder] = highestBid;     //Store the amount to be returned to current highest bidder
        }
        
        
        highestBidder = msg.sender;     //Update the highestbid and highestbidder
        highestBid = msg.value; 
         


        
    }

    /// Withdraw a bid that was overbid.
    function withdraw() public returns (bool) {

        // TODO send back the amount in pendingReturns to the sender. Try to avoid the reentrancy attack. Return false if there is an error when sending
         uint amount = pendingReturns[msg.sender];
         require(amount>0,"You have no amount to withdraw");
         pendingReturns[msg.sender] = 0; 
          
        (bool sent,) = msg.sender.call.value(amount)("");

         if(!sent){
            pendingReturns[msg.sender] = amount; //put back the amount to the pending returns if withdraw is failed.
            return false;
            }
         return true;                           //withdraw successful
         

    }

    /// End the auction and send the highest bid
    /// to the beneficiary.
    function auctionEnd() public {
        // TODO make sure that only the beneficiary can trigger this function. Use "require"
        require(msg.sender== beneficiary,"Cannot End, Only beneficiary can end the auction");
        // TODO send money to the beneficiary account. Make sure that it can't call this auctionEnd() multiple times to drain money
        require(!auctionEndFlag,"Auction has ended already!");
        
        auctionEndFlag = true;  // auctionEndFlag should be set to true before the transfer to prevent re-entrancy attack

        (bool sent, ) = beneficiary.call.value(highestBid)("");

        if(!sent)
        {
            revert("Auction end failed, Please re-try!"); //reverts all the state changes in the current call
        }

        
            


        

    }
}