# Smart-Contract-Vulnerable-To-Insecure-Randomness
Smart Contract Vulnerable To Insecure Randomness

# Description
~ A common vulnerability in smart contracts is insecure randomness, which can lead to predictable outcomes and potential exploits by malicious actors.

# vulnerable.sol
~ In this smart contract, the setSecretNumber function is used to set a secret number by hashing the blockhash of the lastBlockNumber. The secretNumber is intended to be unpredictable and secure. However, this approach is flawed because it relies on the miner of the block where the function is called to determine the secretNumber.

~ The vulnerability here is that miners can manipulate the blockhash to some extent, especially in the last block of a given timestamp. Since miners have some control over the content.

# fix.sol
~ In this updated contract:

1. We import the Chainlink VRF contract and inherit from VRFConsumerBase.

2. In the constructor, we initialize the Chainlink VRF by providing the VRF coordinator and LINK token addresses.

3. The requestRandomNumber function allows the owner to request a random number. It generates a unique request ID based on the block number and submits the request to Chainlink VRF.

4. The fulfillRandomness function is called by the Chainlink VRF when the random number is generated. It ensures that the request ID matches and then sets the secretNumber based on the received random number.

~ Using Chainlink VRF, you can achieve a more secure and unpredictable source of randomness in your smart contract. Remember to deploy the contract on the Ethereum network and provide it with the necessary LINK tokens for Chainlink VRF requests to work.
