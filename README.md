# Ethereum-Dapp


INTRODUCTION
------------


 * The aim of the project is to develop a smart contract on Ethereum.
 
 * This smart contract is built for an open auction as a Decentralised Application.
 
 * The general idea of the auction contract is that everyone can send their bids during a bidding period.
 
 * The bids already include sending money / ether in order to bind the bidders to their bid.
 
 * If the highest bid is raised, the previously highest bidder gets their money back.
   
 * After the end of the bidding period, the contract has to be called manually for the beneficiary to receive their money - contracts cannot activate themselves. 



REQUIREMENTS
------------

This project requires the following modules:

 * NodeJS v8.9.4 or later
 * Windows,  Linux or Mac OS X 
 
 <h5>Install Truffle</h5>  
 Truffle is made for building dApps using the Ethereum Virtual Machine (EVM) by providing a development environment, testing framework, and asset pipeline. To  install, run the following command: 

npm  install −g truffle 
 
On a Unix-based system, you may need to add "sudo" before the command. 
You can verify the installation by running "truffle version" on a terminal, you 
should see an output similar to the following: 

T r u f f l e  v5 . 1 . 1 2 ( c o r e :  5 . 1 . 1 2 ) 

S o l i d i t y  v0 . 5 . 1 6   ( s o l c −j s ) 

Node v8 . 1 0 . 0 

Web3 . j s  v1 . 2 . 1 
 
 
<h5>Install Ganache</h5>
Ganache is a personal blockchain that allows developers to create smart contracts, dApps, and test software that is available as a desktop application  and command-line  tool  for  Windows,  Mac,  and  Linux.  To  install, follow the instructions on https://trufflesuite.com/docs/ganache/quickstart 
 
 
 
 EXECUTION
------------
The directory containing the file "truffle-config.js" will be referred as the  root  directory. First, make sure that  you can compile the source code. Open a terminal in the root directory and run the following command: 

t r u f f l e    c o mp il e

You should see a message saying that the compilation was successful. 

Start the Ganache software and run the following command in the root directory: 

t r u f f l e    mi gr a  te 

By default, Ganache provides 10 Ethereum accounts, each has 100 ETH, to interact with the smart contract.  The first account is the one deploying the contract and becomes the beneficiary (see the constructor in the source code). 
 
You can interact with your contract using Truffle console. From the root direc- 
tory, run: 

t r u f f l e   c o n s o l e 


You can make calls or create transactions to the smart contract with some simple Javascript commands as follows. 



* let instance = await Auction.deployed()
* let auctions = await web3.eth.getAccounts()
* instance.bid({to: accounts[0],from: accounts[1],value: 3})   // 0 is beneficiary and value of 3 is transferred from 1 to 0
* instance.withdraw({from:accounts[1]})
* instance.auctionEnd({from:accounts[0]})



RESULTS
------------

* Intial Bid by index-1
  <img width="931" alt="initial bid" src="https://user-images.githubusercontent.com/46106443/153549715-d7d9e044-1098-4801-98d1-a1cc88d56dd3.png">
  
* Higher Bid by idex-2
 <img width="963" alt="index 2 make highest bid" src="https://user-images.githubusercontent.com/46106443/153550001-6b6cc1c9-4446-4cfe-81d3-d118e5cf480d.png">

* Withdrawal by index-1
<img width="742" alt="withdrawal by 1" src="https://user-images.githubusercontent.com/46106443/153550051-cf80ea40-4145-4a62-a902-af3e45724804.png">

* Balance of index-0 before auctionEnd
<img width="1440" alt="before auction ends" src="https://user-images.githubusercontent.com/46106443/153550122-a2275d3c-eef3-4c2b-810e-a46632c48939.png">

* auctionEnd command by index-0
<img width="746" alt="auctionend command" src="https://user-images.githubusercontent.com/46106443/153550159-6b1572b9-8e97-4ac3-aa2d-4dffcb00939e.png">

* Balance of index-0 after auctionEnd
<img width="1440" alt="after auction ends" src="https://user-images.githubusercontent.com/46106443/153550243-e8410aae-2981-424f-9459-31118c9bd56f.png">






















 
