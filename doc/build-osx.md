# macOS Build Instructions and Notes

The commands in this guide should be executed in a Terminal application.
The built-in one is located in
```
/Applications/Utilities/Terminal.app
```

## Preparation

1. Install the macOS command line tools:

```shell
xcode-select --install
```

When the popup appears, click `Install`.

Then install [Homebrew](https://brew.sh).

2. Clone the Chinese Bitcoin Core source code:
    ```shell
    git clone https://github.com/nationalbitcoin/chinesebitcoin
    cd chinesebitcoin
    ```

## Basic dependencies
```shell
brew install automake libtool pkg-config python
```

If you run into issues, check [Homebrew's troubleshooting page](https://docs.brew.sh/Troubleshooting).
See [dependencies.md](dependencies.md) for a complete overview.

If you want to build the disk image with `make deploy` (.dmg / optional), you need RSVG:
```shell
brew install librsvg
```
### Building dependencies

Repository contains a set of preconfigured dependencies, you only need to build them.

```cd depends
make
```

This process may take a while.

## Build Chinese Bitcoin Core

1.    Configure and build the headless Chinese Bitcoin Core binaries as well as the GUI (if Qt is found).

    You can disable the GUI build by passing `--without-gui` to configure.
    ```shell
    ./autogen.sh
    CONFIG_SITE=$PWD/depends/x86_64-apple-darwin19.3.0/share/config.site ./configure --prefix=$PWD/depends/x86_64-apple-darwin19.3.0/
    make # Use -jN here to use parallelism is needed.
    ```

2.  You can also create a  `.dmg` that contains the `.app` bundle (optional):
    ```shell
    make deploy
    ```

## `disable-wallet` mode
When the intention is to run only a P2P node without a wallet, Chinese Bitcoin Core may be
compiled in `disable-wallet` mode with:
```shell
CONFIG_SITE=$PWD/depends/x86_64-apple-darwin19.3.0/share/config.site ./configure --prefix=$PWD/depends/x86_64-apple-darwin19.3.0/ --disable-wallet
```

Mining is possible in disable-wallet mode using the `getblocktemplate` RPC call.

## Running
Chinese Bitcoin Core is now available at `./src/chinesebitcoind`

Before running, you may create an empty configuration file:
```shell
mkdir -p "/Users/${USER}/Library/Application Support/Chinese Bitcoin"

touch "/Users/${USER}/Library/Application Support/Chinese Bitcoin/chinesebitcoin.conf"

chmod 600 "/Users/${USER}/Library/Application Support/Chinese Bitcoin/chinesebitcoin.conf"
```

The first time you run chinesebitcoind, it will start downloading the blockchain. 

You can monitor the download process by looking at the debug.log file:
```shell
tail -f $HOME/Library/Application\ Support/Chinese Bitcoin/debug.log
```

## Other commands:
```shell
./src/chinesebitcoind -daemon      # Starts the bitcoin daemon.
./src/chinesebitcoin-cli --help    # Outputs a list of command-line options.
./src/chinesebitcoin-cli help      # Outputs a list of RPC commands when the daemon is running.
```
