# Copyright (c) 2013-2016 The Bitcoin Core developers
# Distributed under the MIT software license, see the accompanying
# file COPYING or http://www.opensource.org/licenses/mit-license.php.

DIST_SUBDIRS = univalue

AM_LDFLAGS = $(LIBTOOL_LDFLAGS) $(HARDENED_LDFLAGS) $(GPROF_LDFLAGS) $(SANITIZER_LDFLAGS)
AM_CXXFLAGS = $(DEBUG_CXXFLAGS) $(HARDENED_CXXFLAGS) $(WARN_CXXFLAGS) $(NOWARN_CXXFLAGS) $(ERROR_CXXFLAGS) $(GPROF_CXXFLAGS) $(SANITIZER_CXXFLAGS)
AM_CPPFLAGS = $(DEBUG_CPPFLAGS) $(HARDENED_CPPFLAGS)
AM_LIBTOOLFLAGS = --preserve-dup-deps
PTHREAD_FLAGS = $(PTHREAD_CFLAGS) $(PTHREAD_LIBS)
EXTRA_LIBRARIES =

if EMBEDDED_UNIVALUE
LIBUNIVALUE = univalue/libunivalue.la

$(LIBUNIVALUE): $(wildcard univalue/lib/*) $(wildcard univalue/include/*)
	$(AM_V_at)$(MAKE) $(AM_MAKEFLAGS) -C $(@D) $(@F)
else
LIBUNIVALUE = $(UNIVALUE_LIBS)
endif

BITCOIN_INCLUDES=-I$(builddir) $(BDB_CPPFLAGS) $(BOOST_CPPFLAGS) $(LEVELDB_CPPFLAGS) $(CRYPTO_CFLAGS)
BITCOIN_INCLUDES += -I$(srcdir)/ref10
BITCOIN_INCLUDES += $(UNIVALUE_CFLAGS)

LIBRUSSIANBITCOIN_SERVER=libchinesebitcoin_server.a
LIBRUSSIANBITCOIN_COMMON=libchinesebitcoin_common.a
LIBRUSSIANBITCOIN_CONSENSUS=libchinesebitcoin_consensus.a
LIBRUSSIANBITCOIN_CLI=libchinesebitcoin_cli.a
LIBRUSSIANBITCOIN_UTIL=libchinesebitcoin_util.a
LIBRUSSIANBITCOIN_CRYPTO_BASE=crypto/libchinesebitcoin_crypto_base.a
LIBRUSSIANBITCOINQT=qt/libchinesebitcoinqt.a

if ENABLE_ZMQ
LIBRUSSIANBITCOIN_ZMQ=libchinesebitcoin_zmq.a
endif
if BUILD_BITCOIN_LIBS
LIBRUSSIANBITCOINCONSENSUS=libchinesebitcoinconsensus.la
endif
if ENABLE_WALLET
LIBRUSSIANBITCOIN_WALLET=libchinesebitcoin_wallet.a
LIBRUSSIANBITCOIN_WALLET_TOOL=libchinesebitcoin_wallet_tool.a
endif

LIBRUSSIANBITCOIN_CRYPTO= $(LIBRUSSIANBITCOIN_CRYPTO_BASE)
if ENABLE_SSE41
LIBRUSSIANBITCOIN_CRYPTO_SSE41 = crypto/libchinesebitcoin_crypto_sse41.a
LIBRUSSIANBITCOIN_CRYPTO += $(LIBRUSSIANBITCOIN_CRYPTO_SSE41)
endif
if ENABLE_AVX2
LIBRUSSIANBITCOIN_CRYPTO_AVX2 = crypto/libchinesebitcoin_crypto_avx2.a
LIBRUSSIANBITCOIN_CRYPTO += $(LIBRUSSIANBITCOIN_CRYPTO_AVX2)
endif
if ENABLE_SHANI
LIBRUSSIANBITCOIN_CRYPTO_SHANI = crypto/libchinesebitcoin_crypto_shani.a
LIBRUSSIANBITCOIN_CRYPTO += $(LIBRUSSIANBITCOIN_CRYPTO_SHANI)
endif

# Make is not made aware of per-object dependencies to avoid limiting building parallelization
# But to build the less dependent modules first, we manually select their order here:
EXTRA_LIBRARIES += \
  $(LIBRUSSIANBITCOIN_CRYPTO) \
  $(LIBRUSSIANBITCOIN_UTIL) \
  $(LIBRUSSIANBITCOIN_COMMON) \
  $(LIBRUSSIANBITCOIN_CONSENSUS) \
  $(LIBRUSSIANBITCOIN_SERVER) \
  $(LIBRUSSIANBITCOIN_CLI) \
  $(LIBRUSSIANBITCOIN_WALLET) \
  $(LIBRUSSIANBITCOIN_WALLET_TOOL) \
  $(LIBRUSSIANBITCOIN_ZMQ)

lib_LTLIBRARIES = $(LIBRUSSIANBITCOINCONSENSUS)

bin_PROGRAMS =
noinst_PROGRAMS =
TESTS =
BENCHMARKS =

if BUILD_BITCOIND
  bin_PROGRAMS += chinesebitcoind
endif

if BUILD_BITCOIN_NODE
  bin_PROGRAMS += chinesebitcoin-node
endif

if BUILD_BITCOIN_CLI
  bin_PROGRAMS += chinesebitcoin-cli
endif
if BUILD_BITCOIN_TX
  bin_PROGRAMS += chinesebitcoin-tx
endif
if ENABLE_WALLET
if BUILD_BITCOIN_WALLET
  bin_PROGRAMS += chinesebitcoin-wallet
endif
endif

.PHONY: FORCE check-symbols check-security
# bitcoin core #
BITCOIN_CORE_H = \
  addrdb.h \
  addrman.h \
  addressbook.h \
  attributes.h \
  banman.h \
  base58.h \
  bech32.h \
  blockencodings.h \
  blockfilter.h \
  bloom.h \
  chain.h \
  chainparams.h \
  chainparamsbase.h \
  chainparamsseeds.h \
  checkpoints.h \
  checkqueue.h \
  clientversion.h \
  coins.h \
  compat.h \
  compat/assumptions.h \
  compat/byteswap.h \
  compat/cpuid.h \
  compat/endian.h \
  compat/sanity.h \
  compressor.h \
  consensus/consensus.h \
  consensus/tx_check.h \
  consensus/tx_verify.h \
  core_io.h \
  core_memusage.h \
  cuckoocache.h \
  dbwrapper.h \
  flatfile.h \
  fs.h \
  httprpc.h \
  httpserver.h \
  index/base.h \
  index/blockfilterindex.h \
  index/disktxpos.h \
  index/txindex.h \
  indirectmap.h \
  init.h \
  interfaces/chain.h \
  interfaces/handler.h \
  interfaces/node.h \
  interfaces/wallet.h \
  key.h \
  key_io.h \
  logging.h \
  logging/timer.h \
  memusage.h \
  merkleblock.h \
  miner.h \
  net.h \
  net_permissions.h \
  net_processing.h \
  net_types.h \
  netaddress.h \
  netbase.h \
  netmessagemaker.h \
  node/coin.h \
  node/coinstats.h \
  node/context.h \
  node/psbt.h \
  node/transaction.h \
  node/ui_interface.h \
  node/utxo_snapshot.h \
  noui.h \
  optional.h \
  outputtype.h \
  policy/feerate.h \
  policy/fees.h \
  policy/policy.h \
  policy/rbf.h \
  policy/settings.h \
  poa.h \
  pos.h \
  protocol.h \
  psbt.h \
  random.h \
  randomenv.h \
  reverse_iterator.h \
  rpc/blockchain.h \
  rpc/client.h \
  rpc/mining.h \
  rpc/protocol.h \
  rpc/rawtransaction_util.h \
  rpc/register.h \
  rpc/request.h \
  rpc/server.h \
  rpc/util.h \
  scheduler.h \
  script/descriptor.h \
  script/keyorigin.h \
  script/sigcache.h \
  script/sign.h \
  script/signingprovider.h \
  script/standard.h \
  shutdown.h \
  streams.h \
  support/allocators/secure.h \
  support/allocators/zeroafterfree.h \
  support/cleanse.h \
  support/events.h \
  support/lockedpool.h \
  sync.h \
  threadinterrupt.h \
  threadsafety.h \
  timedata.h \
  torcontrol.h \
  txdb.h \
  txrequest.h \
  txmempool.h \
  undo.h \
  util/asmap.h \
  util/bip32.h \
  util/bytevectorhash.h \
  util/check.h \
  util/error.h \
  util/fees.h \
  util/golombrice.h \
  util/macros.h \
  util/memory.h \
  util/message.h \
  util/moneystr.h \
  util/rbf.h \
  util/ref.h \
  util/settings.h \
  util/spanparsing.h \
  util/string.h \
  util/system.h \
  util/threadnames.h \
  util/time.h \
  util/translation.h \
  util/ui_change_type.h \
  util/url.h \
  util/vector.h \
  validation.h \
  validationinterface.h \
  versionbits.h \
  versionbitsinfo.h \
  wallet/bdb.h \
  wallet/coincontrol.h \
  wallet/coinselection.h \
  wallet/context.h \
  wallet/crypter.h \
  wallet/db.h \
  wallet/feebumper.h \
  wallet/fees.h \
  wallet/ismine.h \
  wallet/load.h \
  wallet/rpcwallet.h \
  wallet/salvage.h \
  wallet/scriptpubkeyman.h \
  wallet/sqlite.h \
  wallet/wallet.h \
  wallet/walletdb.h \
  wallet/wallettool.h \
  wallet/walletutil.h \
  walletinitinterface.h \
  warnings.h \
  zmq/zmqabstractnotifier.h \
  zmq/zmqnotificationinterface.h \
  zmq/zmqpublishnotifier.h \
  zmq/zmqrpc.h \
  zmq/zmqutil.h


obj/build.h: FORCE
	@$(MKDIR_P) $(builddir)/obj
	@$(top_srcdir)/share/genbuild.sh "$(abs_top_builddir)/src/obj/build.h" \
	  "$(abs_top_srcdir)"
libchinesebitcoin_util_a-clientversion.$(OBJEXT): obj/build.h

# server: shared between bitcoind and bitcoin-qt
# Contains code accessing mempool and chain state that is meant to be separated
# from wallet and gui code (see node/README.md). Shared code should go in
# libchinesebitcoin_common or libchinesebitcoin_util libraries, instead.
libchinesebitcoin_server_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES) $(MINIUPNPC_CPPFLAGS) $(EVENT_CFLAGS) $(EVENT_PTHREADS_CFLAGS)
libchinesebitcoin_server_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_server_a_SOURCES = \
  addrdb.cpp \
  addrman.cpp \
  banman.cpp \
  blockencodings.cpp \
  blockfilter.cpp \
  chain.cpp \
  checkpoints.cpp \
  consensus/tx_verify.cpp \
  dbwrapper.cpp \
  flatfile.cpp \
  httprpc.cpp \
  httpserver.cpp \
  index/base.cpp \
  index/blockfilterindex.cpp \
  index/txindex.cpp \
  init.cpp \
  interfaces/chain.cpp \
  interfaces/node.cpp \
  miner.cpp \
  net.cpp \
  net_processing.cpp \
  node/coin.cpp \
  node/coinstats.cpp \
  node/context.cpp \
  node/psbt.cpp \
  node/transaction.cpp \
  node/ui_interface.cpp \
  noui.cpp \
  policy/fees.cpp \
  policy/rbf.cpp \
  policy/settings.cpp \
  poa.cpp \
  pos.cpp \
  rest.cpp \
  rpc/blockchain.cpp \
  rpc/mining.cpp \
  rpc/misc.cpp \
  rpc/net.cpp \
  rpc/rawtransaction.cpp \
  rpc/server.cpp \
  script/sigcache.cpp \
  shutdown.cpp \
  timedata.cpp \
  torcontrol.cpp \
  txdb.cpp \
  txrequest.cpp \
  txmempool.cpp \
  validation.cpp \
  validationinterface.cpp \
  versionbits.cpp \
  $(BITCOIN_CORE_H)

if ENABLE_WALLET
libchinesebitcoin_server_a_SOURCES += wallet/init.cpp
endif
if !ENABLE_WALLET
libchinesebitcoin_server_a_SOURCES += dummywallet.cpp
endif

if ENABLE_ZMQ
libchinesebitcoin_zmq_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES) $(ZMQ_CFLAGS)
libchinesebitcoin_zmq_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_zmq_a_SOURCES = \
  zmq/zmqabstractnotifier.cpp \
  zmq/zmqnotificationinterface.cpp \
  zmq/zmqpublishnotifier.cpp \
  zmq/zmqrpc.cpp \
  zmq/zmqutil.cpp
endif


# wallet: shared between bitcoind and bitcoin-qt, but only linked
# when wallet enabled
libchinesebitcoin_wallet_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES) $(SQLITE_CFLAGS)
libchinesebitcoin_wallet_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_wallet_a_SOURCES = \
  interfaces/wallet.cpp \
  addressbook.cpp \
  wallet/bdb.cpp \
  wallet/coincontrol.cpp \
  wallet/context.cpp \
  wallet/crypter.cpp \
  wallet/db.cpp \
  wallet/feebumper.cpp \
  wallet/fees.cpp \
  wallet/load.cpp \
  wallet/rpcdump.cpp \
  wallet/rpcwallet.cpp \
  wallet/salvage.cpp \
  wallet/scriptpubkeyman.cpp \
  wallet/wallet.cpp \
  wallet/walletdb.cpp \
  wallet/walletutil.cpp \
  wallet/coinselection.cpp \
  $(BITCOIN_CORE_H)

if USE_SQLITE
libchinesebitcoin_wallet_a_SOURCES += wallet/sqlite.cpp
endif

libchinesebitcoin_wallet_tool_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
libchinesebitcoin_wallet_tool_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_wallet_tool_a_SOURCES = \
  wallet/wallettool.cpp \
  $(BITCOIN_CORE_H)

# crypto primitives library
crypto_libchinesebitcoin_crypto_base_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libchinesebitcoin_crypto_base_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libchinesebitcoin_crypto_base_a_SOURCES = \
  ref10/hash/hmac_sha3.h \
  ref10/hash/ripemd160.h \
  ref10/hash/sha3.h \
  ref10/ed25519.h \
  ref10/fe.h \
  ref10/fixedint.h \
  ref10/ge.h \
  ref10/precomp_data.h \
  ref10/sc.h \
  ref10/hash/hmac_sha3.c \
  ref10/hash/ripemd160.c \
  ref10/hash/sha3.c \
  ref10/add_scalar.c \
  ref10/fe.c \
  ref10/ge.c \
  ref10/key_exchange.c \
  ref10/keychain.c \
  ref10/keypair.c \
  ref10/sign.c \
  ref10/sc.c \
  ref10/verify.c \
  crypto/aes.cpp \
  crypto/aes.h \
  crypto/chacha_poly_aead.h \
  crypto/chacha_poly_aead.cpp \
  crypto/chacha20.h \
  crypto/chacha20.cpp \
  crypto/common.h \
  crypto/hkdf_sha256_32.cpp \
  crypto/hkdf_sha256_32.h \
  crypto/hmac_sha256.cpp \
  crypto/hmac_sha256.h \
  crypto/hmac_sha512.cpp \
  crypto/hmac_sha512.h \
  crypto/poly1305.h \
  crypto/poly1305.cpp \
  crypto/ripemd160.cpp \
  crypto/ripemd160.h \
  crypto/sha1.cpp \
  crypto/sha1.h \
  crypto/sha256.cpp \
  crypto/sha256.h \
  crypto/sha3.cpp \
  crypto/sha3.h \
  crypto/sha3-512.cpp \
  crypto/sha3-512.h \
  crypto/sha3-256.cpp \
  crypto/sha3-256.h \
  crypto/sha512.cpp \
  crypto/sha512.h \
  crypto/siphash.cpp \
  crypto/siphash.h

if USE_ASM
crypto_libchinesebitcoin_crypto_base_a_SOURCES += crypto/sha256_sse4.cpp
endif

crypto_libchinesebitcoin_crypto_sse41_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libchinesebitcoin_crypto_sse41_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libchinesebitcoin_crypto_sse41_a_CXXFLAGS += $(SSE41_CXXFLAGS)
crypto_libchinesebitcoin_crypto_sse41_a_CPPFLAGS += -DENABLE_SSE41
crypto_libchinesebitcoin_crypto_sse41_a_SOURCES = crypto/sha256_sse41.cpp

crypto_libchinesebitcoin_crypto_avx2_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libchinesebitcoin_crypto_avx2_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libchinesebitcoin_crypto_avx2_a_CXXFLAGS += $(AVX2_CXXFLAGS)
crypto_libchinesebitcoin_crypto_avx2_a_CPPFLAGS += -DENABLE_AVX2
crypto_libchinesebitcoin_crypto_avx2_a_SOURCES = crypto/sha256_avx2.cpp

crypto_libchinesebitcoin_crypto_shani_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
crypto_libchinesebitcoin_crypto_shani_a_CPPFLAGS = $(AM_CPPFLAGS)
crypto_libchinesebitcoin_crypto_shani_a_CXXFLAGS += $(SHANI_CXXFLAGS)
crypto_libchinesebitcoin_crypto_shani_a_CPPFLAGS += -DENABLE_SHANI
crypto_libchinesebitcoin_crypto_shani_a_SOURCES = crypto/sha256_shani.cpp

# consensus: shared between all executables that validate any consensus rules.
libchinesebitcoin_consensus_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
libchinesebitcoin_consensus_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_consensus_a_SOURCES = \
  amount.h \
  arith_uint256.cpp \
  arith_uint256.h \
  consensus/merkle.cpp \
  consensus/merkle.h \
  consensus/params.h \
  consensus/tx_check.cpp \
  consensus/validation.h \
  hash.cpp \
  hash.h \
  prevector.h \
  primitives/block.cpp \
  primitives/block.h \
  primitives/transaction.cpp \
  primitives/transaction.h \
  pubkey.cpp \
  pubkey.h \
  script/chinesebitcoinconsensus.cpp \
  script/interpreter.cpp \
  script/interpreter.h \
  script/script.cpp \
  script/script.h \
  script/script_error.cpp \
  script/script_error.h \
  serialize.h \
  span.h \
  tinyformat.h \
  uint256.cpp \
  uint256.h \
  util/strencodings.cpp \
  util/strencodings.h \
  version.h

# common: shared between bitcoind, and bitcoin-qt and non-server tools
libchinesebitcoin_common_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
libchinesebitcoin_common_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_common_a_SOURCES = \
  base58.cpp \
  bech32.cpp \
  bloom.cpp \
  chainparams.cpp \
  coins.cpp \
  compressor.cpp \
  core_read.cpp \
  core_write.cpp \
  key.cpp \
  key_io.cpp \
  merkleblock.cpp \
  netaddress.cpp \
  netbase.cpp \
  net_permissions.cpp \
  outputtype.cpp \
  policy/feerate.cpp \
  policy/policy.cpp \
  protocol.cpp \
  psbt.cpp \
  rpc/rawtransaction_util.cpp \
  rpc/util.cpp \
  scheduler.cpp \
  script/descriptor.cpp \
  script/sign.cpp \
  script/signingprovider.cpp \
  script/standard.cpp \
  versionbitsinfo.cpp \
  warnings.cpp \
  $(BITCOIN_CORE_H)

# util: shared between all executables.
# This library *must* be included to make sure that the glibc
# backward-compatibility objects and their sanity checks are linked.
libchinesebitcoin_util_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
libchinesebitcoin_util_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_util_a_SOURCES = \
  support/lockedpool.cpp \
  chainparamsbase.cpp \
  clientversion.cpp \
  compat/glibc_sanity.cpp \
  compat/glibcxx_sanity.cpp \
  compat/strnlen.cpp \
  fs.cpp \
  interfaces/handler.cpp \
  logging.cpp \
  random.cpp \
  randomenv.cpp \
  rpc/request.cpp \
  support/cleanse.cpp \
  sync.cpp \
  threadinterrupt.cpp \
  util/asmap.cpp \
  util/bip32.cpp \
  util/bytevectorhash.cpp \
  util/error.cpp \
  util/fees.cpp \
  util/system.cpp \
  util/message.cpp \
  util/moneystr.cpp \
  util/rbf.cpp \
  util/settings.cpp \
  util/threadnames.cpp \
  util/spanparsing.cpp \
  util/strencodings.cpp \
  util/string.cpp \
  util/time.cpp \
  $(BITCOIN_CORE_H)

if USE_LIBEVENT
libchinesebitcoin_util_a_SOURCES += util/url.cpp
endif

if GLIBC_BACK_COMPAT
libchinesebitcoin_util_a_SOURCES += compat/glibc_compat.cpp
AM_LDFLAGS += $(COMPAT_LDFLAGS)
endif

# cli: shared between bitcoin-cli and bitcoin-qt
libchinesebitcoin_cli_a_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
libchinesebitcoin_cli_a_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
libchinesebitcoin_cli_a_SOURCES = \
  compat/stdin.h \
  compat/stdin.cpp \
  rpc/client.cpp \
  $(BITCOIN_CORE_H)

nodist_libchinesebitcoin_util_a_SOURCES = $(srcdir)/obj/build.h
#

# bitcoind & bitcoin-node binaries #
bitcoin_daemon_sources = chinesebitcoind.cpp
bitcoin_bin_cppflags = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
bitcoin_bin_cxxflags = $(AM_CXXFLAGS) $(PIE_FLAGS)
bitcoin_bin_ldflags = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS) $(PTHREAD_FLAGS)

if TARGET_WINDOWS
bitcoin_daemon_sources += chinesebitcoind-res.rc
endif

bitcoin_bin_ldadd = \
  $(LIBRUSSIANBITCOIN_SERVER) \
  $(LIBRUSSIANBITCOIN_WALLET) \
  $(LIBRUSSIANBITCOIN_SERVER) \
  $(LIBRUSSIANBITCOIN_COMMON) \
  $(LIBRUSSIANBITCOIN_UTIL) \
  $(LIBUNIVALUE) \
  $(LIBRUSSIANBITCOIN_ZMQ) \
  $(LIBRUSSIANBITCOIN_CONSENSUS) \
  $(LIBRUSSIANBITCOIN_CRYPTO) \
  $(LIBLEVELDB) \
  $(LIBLEVELDB_SSE42) \
  $(LIBMEMENV)

bitcoin_bin_ldadd += $(BOOST_LIBS) $(BDB_LIBS) $(CRYPTO_LIBS) $(MINIUPNPC_LIBS) $(EVENT_PTHREADS_LIBS) $(EVENT_LIBS) $(ZMQ_LIBS) $(SQLITE_LIBS)

chinesebitcoind_SOURCES = $(bitcoin_daemon_sources)
chinesebitcoind_CPPFLAGS = $(bitcoin_bin_cppflags)
chinesebitcoind_CXXFLAGS = $(bitcoin_bin_cxxflags)
chinesebitcoind_LDFLAGS = $(bitcoin_bin_ldflags)
chinesebitcoind_LDADD = $(LIBRUSSIANBITCOIN_SERVER) $(bitcoin_bin_ldadd)

chinesebitcoin_node_SOURCES = $(bitcoin_daemon_sources)
chinesebitcoin_node_CPPFLAGS = $(bitcoin_bin_cppflags)
chinesebitcoin_node_CXXFLAGS = $(bitcoin_bin_cxxflags)
chinesebitcoin_node_LDFLAGS = $(bitcoin_bin_ldflags)
chinesebitcoin_node_LDADD = $(LIBRUSSIANBITCOIN_SERVER) $(bitcoin_bin_ldadd)

# bitcoin-cli binary #
chinesebitcoin_cli_SOURCES = chinesebitcoin-cli.cpp
chinesebitcoin_cli_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES) $(EVENT_CFLAGS)
chinesebitcoin_cli_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
chinesebitcoin_cli_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS) $(PTHREAD_FLAGS)

if TARGET_WINDOWS
chinesebitcoin_cli_SOURCES += chinesebitcoin-cli-res.rc
endif

chinesebitcoin_cli_LDADD = \
  $(LIBRUSSIANBITCOIN_CLI) \
  $(LIBUNIVALUE) \
  $(LIBRUSSIANBITCOIN_UTIL) \
  $(LIBRUSSIANBITCOIN_CRYPTO)

chinesebitcoin_cli_LDADD += $(BOOST_LIBS) $(CRYPTO_LIBS) $(EVENT_LIBS)
#

# bitcoin-tx binary #
chinesebitcoin_tx_SOURCES = chinesebitcoin-tx.cpp
chinesebitcoin_tx_CPPFLAGS = $(AM_CPPFLAGS) $(BITCOIN_INCLUDES)
chinesebitcoin_tx_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)
chinesebitcoin_tx_LDFLAGS = $(RELDFLAGS) $(AM_LDFLAGS) $(LIBTOOL_APP_LDFLAGS) $(PTHREAD_FLAGS)

if TARGET_WINDOWS
chinesebitcoin_tx_SOURCES += chinesebitcoin-tx-res.rc
endif

chinesebitcoin_tx_LDADD = \
  $(LIBUNIVALUE) \
  $(LIBRUSSIANBITCOIN_COMMON) \
  $(LIBRUSSIANBITCOIN_UTIL) \
  $(LIBRUSSIANBITCOIN_CONSENSUS) \
  $(LIBRUSSIANBITCOIN_CRYPTO)

chinesebitcoin_tx_LDADD += $(BOOST_LIBS) $(CRYPTO_LIBS)
#

# bitcoin-wallet binary #
chinesebitcoin_wallet_SOURCES = chinesebitcoin-wallet.cpp
chinesebitcoin_wallet_CPPFLAGS = $(bitcoin_bin_cppflags)
chinesebitcoin_wallet_CXXFLAGS = $(bitcoin_bin_cxxflags)
chinesebitcoin_wallet_LDFLAGS = $(bitcoin_bin_ldflags)
chinesebitcoin_wallet_LDADD = $(LIBRUSSIANBITCOIN_SERVER) $(LIBRUSSIANBITCOIN_WALLET_TOOL) $(bitcoin_bin_ldadd)

if TARGET_WINDOWS
chinesebitcoin_wallet_SOURCES += chinesebitcoin-wallet-res.rc
endif
#

# bitcoinconsensus library #
if BUILD_BITCOIN_LIBS
include_HEADERS = script/chinesebitcoinconsensus.h
libchinesebitcoinconsensus_la_SOURCES = support/cleanse.cpp $(crypto_libchinesebitcoin_crypto_base_a_SOURCES) $(libchinesebitcoin_consensus_a_SOURCES)

if GLIBC_BACK_COMPAT
  libchinesebitcoinconsensus_la_SOURCES += compat/glibc_compat.cpp
endif

libchinesebitcoinconsensus_la_LDFLAGS = $(AM_LDFLAGS) -no-undefined $(RELDFLAGS)
libchinesebitcoinconsensus_la_LIBADD = 
libchinesebitcoinconsensus_la_CPPFLAGS = $(AM_CPPFLAGS) -I$(builddir)/obj -I$(srcdir)/ref10 -DBUILD_BITCOIN_INTERNAL
libchinesebitcoinconsensus_la_CXXFLAGS = $(AM_CXXFLAGS) $(PIE_FLAGS)

endif
#

CTAES_DIST =  crypto/ctaes/bench.c
CTAES_DIST += crypto/ctaes/ctaes.c
CTAES_DIST += crypto/ctaes/ctaes.h
CTAES_DIST += crypto/ctaes/README.md
CTAES_DIST += crypto/ctaes/test.c

CLEANFILES = $(EXTRA_LIBRARIES)

CLEANFILES += *.gcda *.gcno
CLEANFILES += compat/*.gcda compat/*.gcno
CLEANFILES += consensus/*.gcda consensus/*.gcno
CLEANFILES += crc32c/src/*.gcda crc32c/src/*.gcno
CLEANFILES += crypto/*.gcda crypto/*.gcno
CLEANFILES += index/*.gcda index/*.gcno
CLEANFILES += interfaces/*.gcda interfaces/*.gcno
CLEANFILES += node/*.gcda node/*.gcno
CLEANFILES += policy/*.gcda policy/*.gcno
CLEANFILES += primitives/*.gcda primitives/*.gcno
CLEANFILES += rpc/*.gcda rpc/*.gcno
CLEANFILES += script/*.gcda script/*.gcno
CLEANFILES += support/*.gcda support/*.gcno
CLEANFILES += univalue/*.gcda univalue/*.gcno
CLEANFILES += util/*.gcda util/*.gcno
CLEANFILES += wallet/*.gcda wallet/*.gcno
CLEANFILES += zmq/*.gcda zmq/*.gcno
CLEANFILES += obj/build.h

EXTRA_DIST = $(CTAES_DIST)


config/bitcoin-config.h: config/stamp-h1
	@$(MAKE) -C $(top_builddir) $(subdir)/$(@)
config/stamp-h1: $(top_srcdir)/$(subdir)/config/bitcoin-config.h.in $(top_builddir)/config.status
	$(AM_V_at)$(MAKE) -C $(top_builddir) $(subdir)/$(@)
$(top_srcdir)/$(subdir)/config/bitcoin-config.h.in:  $(am__configure_deps)
	$(AM_V_at)$(MAKE) -C $(top_srcdir) $(subdir)/config/bitcoin-config.h.in

clean-local:
	-$(MAKE) -C univalue clean
	-rm -f leveldb/*/*.gcda leveldb/*/*.gcno leveldb/helpers/memenv/*.gcda leveldb/helpers/memenv/*.gcno
	-rm -f config.h

.rc.o:
	@test -f $(WINDRES)
	## FIXME: How to get the appropriate modulename_CPPFLAGS in here?
	$(AM_V_GEN) $(WINDRES) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(CPPFLAGS) -DWINDRES_PREPROC -i $< -o $@

check-symbols: $(bin_PROGRAMS)
if TARGET_DARWIN
	@echo "Checking macOS dynamic libraries..."
	$(AM_V_at) OTOOL=$(OTOOL) $(PYTHON) $(top_srcdir)/contrib/devtools/symbol-check.py $(bin_PROGRAMS)
endif

if TARGET_WINDOWS
	@echo "Checking Windows dynamic libraries..."
	$(AM_V_at) OBJDUMP=$(OBJDUMP) $(PYTHON) $(top_srcdir)/contrib/devtools/symbol-check.py $(bin_PROGRAMS)
endif

if GLIBC_BACK_COMPAT
	@echo "Checking glibc back compat..."
	$(AM_V_at) READELF=$(READELF) CPPFILT=$(CPPFILT) $(PYTHON) $(top_srcdir)/contrib/devtools/symbol-check.py $(bin_PROGRAMS)
endif

if EMBEDDED_LEVELDB
include Makefile.crc32c.include
include Makefile.leveldb.include
endif

if ENABLE_QT
include Makefile.qt.include
endif
