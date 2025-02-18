VERSION=$(git tag | tail -1 | cut -d'v' -f 2)
ARCH=amd64
src=$(git rev-parse --show-toplevel)

# Create temporary directories
cp -r clionly_template "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}"
cp -r qtonly_template "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}"
cp -r full_template "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}"
cp -r blob_template "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu"

# Replace version and architecture
sed -i "s/VERSION/${VERSION}/" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/VERSION/${VERSION}/" "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/VERSION/${VERSION}/" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/DEBIAN/control"

sed -i "s/ARCH/${ARCH}/" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/ARCH/${ARCH}/" "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}/DEBIAN/control"
sed -i "s/ARCH/${ARCH}/" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/DEBIAN/control"

# Copy package contents

## mans

### clionly
cp "$src/doc/man/chinesebitcoind.1" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/chinesebitcoind.1"
cp "$src/doc/man/chinesebitcoin-tx.1" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-tx.1"
cp "$src/doc/man/chinesebitcoin-cli.1" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-cli.1"
cp "$src/doc/man/chinesebitcoin-wallet.1" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-wallet.1"

### full
cp "$src/doc/man/chinesebitcoind.1" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/share/man/man1/chinesebitcoind.1"
cp "$src/doc/man/chinesebitcoin-tx.1" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-tx.1"
cp "$src/doc/man/chinesebitcoin-cli.1" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-cli.1"
cp "$src/doc/man/chinesebitcoin-wallet.1" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-wallet.1"
cp "$src/doc/man/chinesebitcoin-qt.1" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-qt.1"

### blob
cp "$src/doc/man/chinesebitcoind.1" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/chinesebitcoind.1"
cp "$src/doc/man/chinesebitcoin-tx.1" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/chinesebitcoin-tx.1"
cp "$src/doc/man/chinesebitcoin-cli.1" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/chinesebitcoin-cli.1"
cp "$src/doc/man/chinesebitcoin-wallet.1" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/chinesebitcoin-wallet.1"
cp "$src/doc/man/chinesebitcoin-qt.1" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/share/man/man1/chinesebitcoin-qt.1"

### qtonly

cp "$src/doc/man/chinesebitcoin-qt.1" "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}/share/man/man1/chinesebitcoin-qt.1"

## binaries

### clionly
cp "$src/src/chinesebitcoind" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/bin/chinesebitcoind"
cp "$src/src/chinesebitcoin-tx" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/bin/chinesebitcoin-tx"
cp "$src/src/chinesebitcoin-cli" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/bin/chinesebitcoin-cli"
cp "$src/src/chinesebitcoin-wallet" "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}/bin/chinesebitcoin-wallet"

### full
cp "$src/src/chinesebitcoind" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/bin/chinesebitcoind"
cp "$src/src/chinesebitcoin-tx" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/bin/chinesebitcoin-tx"
cp "$src/src/chinesebitcoin-cli" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/bin/chinesebitcoin-cli"
cp "$src/src/chinesebitcoin-wallet" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/bin/chinesebitcoin-wallet"
cp "$src/src/qt/chinesebitcoin-qt" "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}/bin/chinesebitcoin-qt"

### blob
cp "$src/src/chinesebitcoind" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/chinesebitcoind"
cp "$src/src/chinesebitcoin-tx" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/chinesebitcoin-tx"
cp "$src/src/chinesebitcoin-cli" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/chinesebitcoin-cli"
cp "$src/src/chinesebitcoin-wallet" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/chinesebitcoin-wallet"
cp "$src/src/qt/chinesebitcoin-qt" "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu/usr/local/bin/chinesebitcoin-qt"


### qtonly
cp "$src/src/qt/chinesebitcoin-qt" "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}/bin/chinesebitcoin-qt"

# Build packages
dpkg -b "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}"
dpkg -b "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}"
dpkg -b "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}"
tar -czf "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu.tar.gz" -C "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu" .

# Remove temporary directories
rm -rf "$PWD/chinesebitcoin_clionly-${VERSION}_${ARCH}"
rm -rf "$PWD/chinesebitcoin_qtonly-${VERSION}_${ARCH}"
rm -rf "$PWD/chinesebitcoin_full-${VERSION}_${ARCH}"
rm -rf "$PWD/chinesebitcoin-${VERSION}-${ARCH}-linux-gnu"
