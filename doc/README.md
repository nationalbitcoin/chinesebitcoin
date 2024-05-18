Chinese Bitcoin Core
=============

Setup
---------------------
Chinese Bitcoin Core is the original client and it builds the backbone of the network. It downloads and, by default, stores the entire history of transactions, which requires a few gigabytes of disk space.

To download Chinese Bitcoin Core, visit [chinesebitcoin.nationalbitcoin.org](http://chinesebitcoin.nationalbitcoin.org/download/).

Running
---------------------
The following are some helpful notes on how to run Chinese Bitcoin Core on your native platform.

### Unix

Unpack the files into a directory and run:

- `bin/chinesebitcoin-qt` (GUI) or
- `bin/chinesebitcoind` (headless)

### Windows

Unpack the files into a directory, and then run chinesebitcoin-qt.exe.

### macOS

Drag Chinese Bitcoin Core to your applications folder, and then run Chinese Bitcoin Core.

Building
---------------------
The following are developer notes on how to build Chinese Bitcoin Core on your native platform. They are not complete guides, but include notes on the necessary libraries, compile flags, etc.

- [Dependencies](dependencies.md)
- [macOS Build Notes](build-osx.md)
- [Unix Build Notes](build-unix.md)
- [FreeBSD Build Notes](build-freebsd.md)

Development
---------------------
The repo's [root README](/README.md) contains relevant information on the development process and automated testing.

- [Shared Libraries](shared-libraries.md)

### Miscellaneous
- [Assets Attribution](assets-attribution.md)
- [chinesebitcoin.conf Configuration File](chinesebitcoin-conf.md)
- [Files](files.md)
- [Tor Support](tor.md)

License
---------------------
Distributed under the [MIT software license](/COPYING).
