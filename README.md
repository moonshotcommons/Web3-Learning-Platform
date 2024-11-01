## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
服务器私钥，用于签名：0x2F380B03E9b53CE91F0D74A5eE020Cd1Afc99C96
forge create --rpc-url sepolia --private-key $DEPLOYER_PRIVATE_KEY --verify src/HackQuest.sol:HackQuest --constructor-args 0x2F380B03E9b53CE91F0D74A5eE020Cd1Afc99C96


forge script script/HackQuest.s.sol:HackQuestScript --rpc-url sepolia --broadcast --verify -vvvv

-- mint NFT
0x0794e3D4B37d2d2B5732cd71Bd316d0b59e96055
export alice=xxx
export contract_add=0xFC4679a1ba24783DD4Bf07e3Bbd8340f6Ec7BDfa
cast send --private-key $alice $contract_add "safeMint()" --rpc-url sepolia



export sig=0x7113b229f5263e0f96eb7119cdf843a616a19bee0f15141c72a77def4a7a69ac6c7efbaf81cfe0f55114ec5d970adaa71213f6f24f585dc761fa56f573c1f7fc1c
cast send --private-key $alice $contract_add "compleCourse(uint256,uint8,bytes)" 0 5 $sig --rpc-url sepolia



export sig=0x82d10c36f5f167713e52f38ec159bf506c458841df60d1282ff066105c00130c2e090b965b960e8aacb2e71c29b43b2cae607a4907aa7ede4c51eeaae1ef404e1b
cast send --private-key $alice $contract_add "compleCourse(uint256,uint8,bytes)" 0 10 $sig --rpc-url sepolia
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
