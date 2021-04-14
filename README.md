# Treasury Smart Contract

This is a mock up contract made to learn and understand Soldity syntax.

The functionality of the smart contract is to hold funds securely and prime it to execute a transaction once a call is made. Alternatively, block.timestamp could be used to automatically execute the call for a specific point in time (i.e. at the end of a vesting period).

The use of this contract on the Ethereum main net is highly discouraged. The payout() function can only execute one time - Improperly setting your payout address/addresses and transaction amount/amounts will cause any funds left in the smart contract to be permanently locked in it.