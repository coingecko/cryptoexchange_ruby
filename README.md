[![Build Status](https://travis-ci.org/coingecko/cryptoexchange.svg)](https://travis-ci.org/coingecko/cryptoexchange)

# Cryptoexchange

Cryptoexchange is a rubygem for ruby developers to interact with over 200+ cryptocurrency exchange market data APIs in a single library.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptoexchange'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptoexchange

## Exchanges Supported

| Exchange          | Ticker  | Order Book | Trade   | Account | Market List | Pair URL | slug              |
| ----------------- | ------- | ---------- | ------- | ------- | ----------- |----------|-------------------|
| 58Coin            | Y       | Y          | Y       |         | Y           | Y        | fifty_eight_coin  |
| Abcc              | Y       | N          | N       |         | Y           | Y        | abcc              |
| Abucoins          | Y       | Y          | Y       |         | Y           |          | abucoins          |
| ACX               | Y       | Y          | Y       |         | Y           | Y        | acx               |
| AEX               | Y       | Y          | Y       |         | Y           |          | aex               |
| Airswap           | Y       |            |         |         |             |          | airswap           |
| Allbit            | Y       | N          | N       |         | Y           | Y        | allbit            |
| Allcoin           | Y       | Y          | Y       |         | Y           |          | allcoin           |
| Alluma            | Y       | N          | N       |         | Y           | N        | alluma            |
| Alterdice         | Y       |            |         |         | Y           | Y        | alterdice         |
| Altilly           | Y       | Y          | Y       |         | Y           | Y        | altilly           |
| Altmarkets        | Y       | Y          | Y       |         | Y           | Y        | altmarkets        |
| ANX               | Y       |            |         |         | User-Defined|          | anx               |
| Aphelion          | Y       |            |         |         | Y           | Y        | aphelion          |
| AXNET             | Y       | Y          | Y       |         | Y           | Y        | axnet             |
| B2BX              | Y       | Y          |         |         | Y           |          | b2bx              |
| Bancor            | Y       | N          | N       |         | Y           |          | bancor            |
| Bcex              | Y       | Y          | Y       |         | Y           | Y        | bcex              |
| Bcoin             | Y       |            |         |         | Y           | Y        | bcoin             |
| Bgogo             | Y       | Y          | Y       |         | Y           | Y        | bgogo             |
| Bibox             | Y       | Y          | Y       |         | Y           | Y        | bibox             |
| BigONE            | Y       | Y          | Y       |         | Y           | Y        | bigone            |
| Bilaxy            | Y       | Y          | Y       |         | Y           | Y        | bilaxy            |
| Binance           | Y       | Y          |         |         | Y           | Y        | binance           |
| Bishang           | Y       |            |         |         | Y           |          | bishang           |
| Bisq              | Y       |            | Y       |         | Y           |          | bisq              |
| Bit2C             | Y       | Y          | Y       |         | User-Defined| Y        | bit2c             |
| Bit-Z             | Y       |            |         |         | Y           |          | bit_z             |
| Bitbank           | Y       | Y          | Y       |         | User-Defined| Y        | bitbank           |
| Bitbay            | Y       |            |         |         | User-Defined|          | bitbay            |
| Bitbegin          | Y       | N          | N       |         | Y           | Y        | bitbegin          |
| BitBNS            | Y       |            |         |         | Y           |          | bitbns            |
| Bitbox (Auth)     | Y       |            |         |         | User-Defined| Y        | bitbox            |
| Bitbox (Public)   | Y       |            |         |         | Y           | Y        | bitbox            |
| Bitconnect        | Y       |            |         |         | Y           |          | bitconnect        |
| Bitebtc           | Y       | Y          | Y       |         | Y           | Y        | bitebtc           |
| Bitex.la          | Y       | Y          |         |         | Y           |          | bitex             |
| Bitexlive         | Y       | N          | N       |         | Y           | Y        | bitexlive         |
| Bitfinex          | Y       |            |         |         | Y           |          | bitfinex          |
| Bitflyer          | Y       |            |         |         | Y           |          | bitflyer          |
| Bitforex          | Y       | N          | N       |         | Y           |          | bitforex          |
| Bithash           | Y       | Y          | Y       |         | Y           | Y        | bithash           |
| Bithumb           | Y       |            |         |         | Y           |          | bithumb           |
| Bitibu            | Y       | Y          | Y       |         | Y           | Y        | bitibu            |
| Bitinfi           | Y       | Y          |         |         | Y           |          | bitinfi           |
| Bitinka           | Y       | Y          |         |         | Y           |          | bitinka           |
| Bitker            | Y       |            |         |         | Y           | Y        | bitker            |
| Bitkonan          | Y       |            |         |         | User-Defined|          | bitkonan          |
| Bitkub            | Y       | Y          | Y       |         | Y           | Y        | bitkub            |
| Bitlish           | Y       | Y          | Y       |         | Y           |          | bitlish           |
| Bitmart           | Y       | Y          | Y       |         | Y           |          | bitmart           |
| Bitmax            | Y       | Y          | Y       |         | Y           | Y        | bitmax            |
| Bitmex            | Y       | Y          | Y       |         | Y           |          | bitmex            |
| BitOnBay          | Y       |            |         |         | Y           |          | bitonbay          |
| Bitpaction        | Y       | Y          | Y       |         | Y           |          | bitpaction        |
| Bitrabbit         | Y       | N          | N       |         | Y           | Y        | bitrabbit         |
| Bitrue            | Y       | N          | N       |         | Y           | Y        | bitrue            |
| Bits Blockchain   | Y       | Y          |         |         | Y           |          | bits_blockchain   |
| Bitsane           | Y       | Y          |         |         | Y           |          | bitsane           |
| Bitso             | Y       |            |         |         | Y           |          | bitso             |
| Bitstamp          | Y       | Y          | Y       |         | User-Defined|          | bitstamp          |
| Bitsten           | Y       | Y          | N       |         | Y           | Y        | bitsten           |
| Bittrex           | Y       |            |         |         | Y           | Y        | bittrex           |
| Bkex              | Y       | N          | N       |         | Y           | Y        | bkex              |
| Bleutrade         | Y       |            |         |         | Y           |          | bleutrade         |
| Blockonix         | Y       | Y          | Y       |         | Y           |          | blockonix         |
| Blokmy            | Y       | Y          | Y       |         | Y           | Y        | blokmy            |
| Braziliex         | Y       | Y          | Y       |         | Y           |          | braziliex         |
| BTC38             |         |            |         |         |             |          |                   |
| BTC-e             |         |            |         |         |             |          |                   |
| BtcAlpha          | Y       | Y          | Y       |         | Y           | Y        | btc_alpha         |
| BtcTradeUa        | Y       | Y          | Y       |         | Y           | Y        | btc_trade_ua      |
| BTCBox            | Y       | Y          |         |         | User-Defined| Y        | btcbox            |
| BTCC              | Y       |            |         |         | User-Defined|          | btcc              |
| BTCChina          |         |            |         |         |             |          |                   |
| BTCMarkets        | Y       | Y          |         |         | Y           | Y        | btcmarkets        |
| Btcsquare         | Y       | Y          | Unstable|         | Y           | Y        | btcsquare         |
| BTCTurk           | Y       | Y          |         |         | Y           |          | btcturk           |
| BTER              | Y       |            |         |         | Y           |          | bter              |
| Buyucoin          | Y       | N          | N       |         | Y           |          | buyucoin          |
| BX Thailand       | Y       |            |         |         | Y           |          | bx_thailand       |
| BW                | Y       |            |         |         | Y           | Y        | bw                |
| Bytex             | Y       | N          | N       |         | Y           | N        | bytex             |
| C2CX              | Y       | Y          | N       |         | Y           |          | c2cx              |
| CPatex            | Y       | Y          | Y       |         | Y           |          | c_patex           |
| CCex              | Y       |            |         |         | Y           |          | ccex              |
| Cex               | Y       | Y          | Y       |         | Y           |          | cex               |
| Cfinex            | Y       | Y          | Y       |         | Y           | Y        | cfinex            |
| Chaince           | Y       |            |         |         | Y           | Y        | chaince           |
| Chainrift         | Y       | Y          | Y       |         | Y           |          | chainrift         |
| ChainEX           | Y       | Y          | Y       |         | Y           |          | chainex           |
| Chaoex            | Y       | Y          | Y       |         | Y           | N        | chaoex            |
| CHBTC             | Y       |            |         |         | User-Defined|          | chbtc             |
| Cobinhood         | Y       | Y          |         |         | Y           | Y        | cobinhood         |
| Coin2001          | Y       | Y          | Y       |         | Y           |          | coin2001          |
| Coinall           | Y       | Y          | Y       |         | Y           |          | coinall           |
| Coin Asset        | Y       | Y          | Y       |         | Y           |          | coinasset         |
| Coinchangex       | Y       | N          | N       |         | Y           | Y        | coinchangex       |
| CoinEgg           | Y       | Y          | Y       |         | User-Defined| Y        | coin_egg          |
| CoinExchange      | Y       |            |         |         | Y           |          | coin_exchange     |
| Coinbe            | Y       |            |         |         | Y           |          | coinbe            |
| Coinbene          | Y       | Y          | Y       |         | Y           | Y        | coinbene          |
| Coincheck         | Y       |            |         |         | User-Defined|          | coincheck         |
| Coindeal          | Y       | Y          |         |         | Y           |          | coindeal          |
| Coindirect        | Y       | N          | N       |         | Y           | Y        | coindirect        |
| Coineal           | Y       | Y          | Y       |         | Y           |          | coineal           |
| Coinex            | Y       | Y          | Y       |         | Y           | Y        | coinex            |
| Coinfalcon        | Y       | Y          | Y       |         | Y           |          | coinfalcon        |
| Coinfield         | Y       | N          | N       |         | Y           | Y        | coinfield         |
| Coingi            | Y       | Y          | Y       |         | Y           | Y        | coingi            |
| Coinhouse         | Y       |            |         |         | Y           | Y        | coinhouse         |
| Coinhub           | Y       | Y          | Y       |         | Y           | Y        | coinhub           |
| CoinJar           | Y       | Y          | Y       |         | Y           | Y        | coinjar           |
| Coinmate          | Y       | Y          |         |         | User-Defined|          | coinmate          |
| Coinmex           | Y       | Y          | Y       |         | Y           |          | coinmex           |
| Coinnest          | Y       | Y          | Y       |         | User-Defined| Y        | coinnest          |
| Coinnox           | Y       | Y          | Y       |         | Y           |          | coinnox           |
| Coinone           | Y       | Y          | Y       |         | Y           | Y        | coinone           |
| Coinpark          | Y       | Y          | Y       |         | Y           | Y        | coinpark          |
| Coinplace         | Y       |            |         |         | Y           |          | coinplace         |
| Coinrail          | Y       | Y          | Y       |         | Y           | Y        | coinrail          |
| Coinroom          | Y       |            |         |         | Y           |          | coinroom          |
| CoinsMarkets      | Y       |            |         |         | Y           |          | coin_markets      |
| Coinsbank         | Y       |            |         |         | Y           |          | coinsbank         |
| Coinsbit          | Y       |            |         |         | Y           |          | coinsbit          |
| Coinstock         | Y       | Y          | Y       |         | Y           |          | coinstock         |
| Coinsuper         | Y       |            |         |         | Y           | Y        | coinsuper         |
| Cointiger         | Y       | Y          | Y       |         | Y           |          | cointiger         |
| Coinut (Auth)     | Y       | Y          | Y       | Y       | Y           |          | coinut            |
| Coinzest          | Y       | Y          |         |         | Y           |          | coinzest          |
| COSS              | Y       |            |         |         | Y           | Y        | coss              |
| Cpdax             | Y       | Y          | Y       |         | Y           |          | cpdax             |
| CredoEx           | Y       |            |         |         | Y           |          | credoex           |
| Crex24            | Y       | Y          | Y       |         | Y           | Y        | crex24            |
| CRXZone           | Y       | Y          | Y       |         | Y           | Y        | crxzone           |
| Cryptagio         | Y       | Y          | Y       |         | Y           | Y        | cryptagio         |
| Cryptaldash       | Y       | Y          | Y       |         | Y           |          | cryptaldash       |
| Cryptex           | Y       | Y          | Y       |         | User-Defined| Y        | cryptex           |
| CryptoBridge      | Y       |            |         |         | Y           | Y        | crypto_bridge     |
| CryptoHub         | Y       | N          | N       |         | Y           |          | crypto_hub        |
| Cryptobulls       | Y       | N          | N       |         | Y           |          | cryptobulls       |
| Cryptology        | Y       |            |         |         | Y           |          | cryptology        |
| Cryptonit         | Y       | Y          | Y       |         | Y           | Y        | cryptonit         |
| Cryptopia         | Y       | Y          | Y       |         | Y           |          | cryptopia         |
| Crytrex           | Y       | Y          | Y       |         | Y           |          | crytrex           |
| Cybex             | Y       | Y          | Y       |         | Y           |          | cybex             |
| Dakuce            | Y       | Y          | Y       |         | Y           |          | dakuce            |
| Dcoin             | Y       | N          | N       |         | Y           | Y        | dcoin             |
| Ddex              | Y       | Y          | Y       |         | Y           | Y        | ddex              |
| DEEX              | Y       |            |         |         | Y           |          | deex              |
| DEx.top           | Y       | Y          | Y       |         | Y           |          | dextop            |
| Digifinex         | Y       |            |         |         | Y           |          | digifinex         |
| Dobitrade         | Y       | Y          | N       |         | Y           | Y        | dobitrade         |
| Dragonex          | Y       | Y          | N       |         | Y           | Y        | dragonex          |
| Dsx               | Y       | Y          | Y       |         | Y           |          | dsx               |
| Ercdex            | Y       | Y          |         |         | Y           |          | erxdex            |
| Escodex           | Y       |            |         |         | Y           | Y        | escodex           |
| EtherDelta        | Y       |            |         |         | Y           |          | ether_delta       |
| Etherflyer        | Y       | Y          | N       |         | Y           | Y        | etherflyer        |
| Ethex             | Y       | N          | N       |         | Y           | N        | ethex             |
| Ethfinex          | Y       | Y          | Y       |         | Y           | Y        | ethfinex          |
| Everbloom         | Y       |            |         |         | Y           |          | everbloom         |
| Exmo              | Y       | Y          | Y       |         | Y           | Y        | exmo              |
| Exrates           | Y       | N          | N       |         | Y           | Y        | exrates           |
| Extstock          | Y       | Y          | Y       |         | Y           | Y        | extstock          |
| Exx               | Y       | Y          | Y       |         | Y           | Y        | exx               |
| F1cx              | Y       | Y          | Y       |         | Y           | Y        | f1cx              |
| FatBTC            | Y       | Y          | Y       |         | Y           |          | fatbtc            |
| Fcoin             | Y       | Y          | Y       |         | Y           | Y        | fcoin             |
| Fex               | Y       | N          | N       |         | Y           |          | fex               |
| Fisco             | Y       | Y          | Y       |         | Y           | Y        | fisco             |
| Forkdelta         | Y       | N          | N       |         | Y           | Y        | forkdelta         |
| Freiexchange      | Y       | Y          |         |         | User-Defined| Y        | freiexchange      |
| FinexBox          | Y       | Y          |         |         | Y           | Y        | finexbox          |
| Gate              | Y       | Y          | Y       |         | Y           | Y        | gate              |
| Gatecoin          | Y       |            |         |         | Y           |          | gatecoin          |
| GDAX(Coinbase Pro)| Y       |            |         |         | Y           | Y        | gdax              |
| Gemini            | Y       | Y          | Y       |         | Y           |          | gemini            |
| GetBTC            | Y       | Y          | Y       |         | User-Defined| Y        | getbtc            |
| Gibraltar         | Y       | N          | N       |         | Y           | Y        | gbx               |     
| Gobaba            | Y       |            |         |         | Y           |          | gobaba            |
| golix (API Failed)| Y       | Y          |         |         | Y           |          | golix             |
| GOPAX             | Y       | Y          | Y       |         | Y           | Y        | gopax             |
| Graviex           | Y       | N          | N       |         | Y           |          | graviex           |
| Hadax             | Y       | N          | N       |         | Y           | Y        | hadax             |
| Hb.top            | Y       | N          | N       |         | Y           | N        | hb_top            |
| Hikenex           | Y       | N          | N       |         | Y           | N        | hikenex           |
| HitBTC            | Y       | Y          | Y       |         | Y           | Y        | hitbtc            |
| Hotbit            | Y       | N          | N       |         | Y           | Y        | hotbit            |
| HPX               | Y       | Y          | Y       |         | Y           |          | hpx               |
| Huobi             | Y       |            |         |         | Y           | Y        | huobi             |
| Ice3x             | Y       | Y          | Y       |         | Y           |          | ice3x             |
| Idax              | Y       | N          | N       |         | Y           | Y        | idax              |
| Idcm              | Y       |            |         |         | Y           | Y        | idcm              |
| Idex              | Y       | Unstable   | Y       |         | Y           | Y        | idex              |
| Incorex           | Y       | Y          | Y       |         | Y           | Y        | incorex           |
| Indodax           | Y       | Y          | Y       |         | User-Defined| N        | indodax           |
| InfinityCoin      | Y       |            |         |         | Y           | Y        | infinity_coin     |
| InstantBitex      | Y       | Y          | Y       |         | Y           |          | instantbitex      |
| Iqfinex           | Y       | Y          | Y       |         | Y           | Y        |
| Ironex            | Y       |            |         |         | Y           |          | ironex            |
| Itbit             | Y       | Y          | Y       |         | User-Defined|          | itbit             |
| Jex               | Y       | N          | N       |         | Y           |          | jex               |
| Joyso             | Y       | Y          |         |         | Y           |          | joyso             |
| Jubi              | Y       |            |         |         | Y           |          | jubi              |
| Kairex            | Y       | Y          |         |         | Y           |          | kairex            |
| KKex              | Y       | Y          | Y       |         | Y           | Y        | k_kex             |
| Kkcoin            | Y       | Y          | Y       |         | Y           | Y        | kkcoin            |
| Koinex            | Y       |            |         |         | Y           |          | koinex            |
| Koinok            | Y       |            |         |         | Y           | Y        | koinok            |
| Korbit            | Y       |            |         |         | User-Defined| Y        | korbit            |
| Kraken            | Y       |            |         |         | Y           | Y        | kraken            |
| Kryptono          | Y       | Y          | Y       |         | User-Defined| Y        | kryptono          |
| Kucoin            | Y       | Y          | Y       |         | Y           | Y        | kucoin            |
| Kuna              | Y       | Y          | Y       |         | User-Defined| Y        | kuna              |
| KyberNetwork      | Y       | N          | N       |         | Y           | Y        | kyber_network     |
| LakeBTC           | Y       |            |         |         | Y           | Y        | lakebtc           |
| Latoken           | Y       |            |         |         | Y           | Y        | latoken           |
| Lbank             | Y       | Y          | Y       |         | Y           | Y        | lbank             |
| Letsdocoinz       | Y       |            |         |         | Y           |          | letsdocoinz       |
| Liqui             | Y       |            |         |         | Y           |          | liqui             |
| LiteBit.eu        | Y       |            |         |         | Y           |          | litebiteu         |
| Livecoin          | Y       |            |         |         | Y           |          | livecoin          |
| Luno              | Y       |            |         |         | Y           | Y        | luno              |
| Lykke             | Y       | Y          | N       |         | Y           |          | lykke             |
| Maplechange       | Y       | Y          |         |         | Y           | Y        | maplechange       |
| MaxMaicoin        | Y       | Y          | Y       |         | Y           | Y        | max_maicoin       |
| MercadoBitcoin    | Y       |            |         |         | User-Defined|          | mercado_bitcoin   |
| Mercatox          | Y       | N          | N       | N       | Y           |          | mercatox          |
| Myspeedtrade      | Y       | Y          |         |         | Y           |          | myspeedtrade      |
| Nanex             | Y       | N          | N       | N       | Y           |          | nanex             |
| Nanu.Exchange     | Y       | Y          | Y       |         | Y           |          | nanu_exchange     |
| Nebula            | Y       | N          | Y       |         | Y           |          | nebula            |
| Negociecoins      | Y       | Y          | Y       |         | User-Defined|          | negociecoins      |
| Neraex            | Y       | Y          | Y       |         | Y           | Y        | neraex            |
| Newdex            | Y       | N          | N       |         | Y           | Y        | newdex            |
| Ninecoin          | Y       |            |         |         | Y           |          | ninecoin          |
| NLexch            | Y       |            |         |         | Y           | Y        | nlexch            |
| Novadex           | Y       | N          | N       |         | Y           | Y        | novadex           |
| Novadax           | Y       | N          | Y       |         | User-Defined| N        | novadax           |
| Nusax             | Y       |            |         |         | Y           | Y        | nusax             |
| Nova Exchange     | Y       |            |         |         | Y           |          | novaexchange      |
| OasisDEX          | Y       |            |         |         | Y           |          | oasisdex          |
| OAX               | Y       |            |         |         | Y           |          | oax               |
| Octaex            | Y       | Y          | Y       |         | Y           |          | octaex            |
| OKCoin            | Y       |            |         |         | User-Defined|          | okcoin            |
| OKEx              | Y       | Y          | Y       |         | Y           | Y        | okex              |
| OmniTrade         | Y       | Y          | Y       | Y       | Y           |          | omnitrade         |
| Ooobtc            | Y       | Y          | Y       |         | Y           | Y        | ooobtc            |
| Openledger        | Y       | Y          | Y       |         | Y           | Y        | openledger        |
| OrderBook         | Y       | Y          | Y       |         | Y           | Y        | orderbook         |
| Ore Bz            | Y       | Y          | Y       |         | Y           | Y        | ore_bz            |
| OTCBTC            | Y       | Y          | Y       |         | Y           |          | otcbtc            |
| P2pb2b            | Y       |            |         |         | Y           |          | p2pb2b            |
| Paribu            | Y       |            |         |         | Y           |          | paribu            |
| Paro Exchange     | Y       |            |         |         | Y           |          | paroexchange      |
| Paymium           | Y       | Y          | Y       |         | User-Defined|          | paymium           |
| Poloniex          | Y       |            |         |         | Y           | Y        | poloniex          |
| Purcow            | Y       |            |         |         | Y           | Y        | purcow            |
| QBTC              | Y       | Y          | Y       |         | Y           |          | qbtc              |
| Qryptos           | Y       |            |         |         | Y           |          | qryptos           |
| QuadrigaCX        | Y       |            |         |         | User-Defined|          | quadrigacx        |
| Quoine            | Y       |            |         |         | Y           | Y        | quoine            |
| RadarRelay        | Y       |            |         |         | Y           | Y        | radar_relay       |
| Raisex            | Y       |            |         |         | Y           |          | raisex            |
| Rfinex            | Y       | Y          | Y       |         | Y           |          | rfinex            |
| RightBTC          | Y       | Y          | Y       |         | Y           |          | rightbtc          |
| SafeTrade         | Y       | N          | N       |         | Y           |          | safe_trade        |
| Secondbtc         | Y       | N          | N       |         | Y           | Y        | secondbtc         |
| Sigen             | Y       |            |         |         | Y           | Y        | sigen             |
| Simex             | Y       | N          | N       |         | Y           | Y        | simex             |
| Singularx         | Y       | N          | N       |         | Y           |          | singularx         |
| Sistemkoin        | Y       |            |         |         | Y           |          | sistemkoin        |
| SouthXchange      | Y       | Y          | Y       |         | Y           | Y        | south_xchange     |
| Stocks Exchange   | Y       |            |         |         | Y           | Y        | stocks_exchange   |
| Swiftex           | Y       | Y          |         |         | Y           | Y        | swiftex           |
| Switcheo          | Y       | N          | N       |         | Y           | Y        | switcheo          |
| Syex              | Y       | N          | N       |         | Y           | Y        | syex              |
| SZZC              | Y       |            |         |         | Y           |          | szzc              |
| Tdax              | Y       | N          | Y       |         | Y           |          | tdax              |
| The Rock Trading  | Y       |            |         |         | Y           |          | therocktrading    |
| The Token Store   | Y       | Y          | Y       |         | Y           | Y        | thetokenstore     |
| Thinkbit          | Y       | Y          | Y       |         | Y           |          | thinkbit          |
| Tideal            | Y       | Y          | Y       |         | Y           |          | tideal            |
| Tidebit           | Y       | Y          | Y       |         | Y           |          | tidebit           |
| Tidex             | Y       |            |         |         | Y           |          | tidex             |
| Tokenjar          | Y       |            |         |         | Y           |          | tokenjar          |
| Tokenomy          | Y       | Y          | Y       |         | Y           | Y        | tokenomy          |
| TokensNet         | Y       | Y          | Y       |         | Y           | N        | tokens_net        |
| Tokok             | Y       | Y          | Y       |         | Y           |          | tokok             |
| Topbtc            | Y       | N          | N       |         | Y           | Y        | topbtc            |
| TradeOgre         | Y       | Y          | Y       |         | Y           | Y        | trade_ogre        |
| Trade Satoshi     | Y       |            |         |         | Y           | Y        | trade_satoshi     |
| Trade.io          | Y       |            |         |         | Y           |          | tradeio           |
| Trade.mn          | Y       | Y          | Y       |         | Y           |          | trademn           |
| TrocaNinja        | Y       | N          | N       |         | Y           |          | troca_ninja       |
| TrustDex **       | Y       |            |         |         | Y           |          | trust_dex         |
| TuxExchange       | Y       |            |         |         | Y           |          | tux_exchange      |
| UEX               | Y       |            |         |         | Y           |          | uex               |
| Unocoin           |         |            |         |         |             |          | unocoin           |
| Upbit             | Y       | Y          | Y       |         | Y           | Y        | upbit             |
| Vaultmex          | Y       | Y          | Y       |         | Y           | Y        | vaultmex          |
| Vbitex            | Y       | N          | N       |         | Y           | Y        | vbitex            |
| Vebitcoin         | Y       | N          | N       |         | Y           | N        | vebitcoin         |
| Vertpig           | Y       | Y          | N       |         | Y           | Y        | vertpig           |
| Viabtc            | Y       |            |         |         | User-Defined|          | viabtc            |
| Waves             | Y       | N          | Y       |         | Y           |          | waves             |
| WazirX            | Y       |            |         |         | Y           |          | wazirx            |
| Wcx               | Y       | Y          | Y       |         | Y           |          | wcx               |
| Wex               | Y       | Y          | Y       |         | Y           | Y        | wex               |
| XS2               | Y       | Y          | Y       |         | Y           | Y        | xs2               |
| Yobit             | Y       |            |         |         | Y           | Y        | yobit             |
| Yuanbao           | Y       |            |         |         | User-Defined|          | yuanbao           |
| Yunbi             | Y       |            |         |         | Y           |          | yunbi             |
| Zaif              | Y       | Y          | Y       |         | Y           | Y        | zaif              |
| ZB                | Y       | Y          | Y       |         | Y           | Y        | zb                |
| ZBG               | Y       | Y          | Y       |         | Y           |          | zbg               |
| Zebpay            | Y       |            |         |         | Y           |          | Zebpay            |
| Zeniex            | Y       | Y          | Y       |         | Y           |          | zeniex            |
| ZG.TOP            | Y       | Y          | Y       |         | Y           |          | zgtop             |

** Mapping and data may be incorrect (Cannot determine correctness)

*** User-Defined requires pair id

## Usage

### List market pairs supported by an exchange

```
  client = Cryptoexchange::Client.new
  pairs = client.pairs('bitflyer')
```

### List exchange services for certain currency

```
  client.exchange_for('btc')

  # ['anx', 'binance', ...]
```

### Query the Ticker API

```
  pair = client.pairs('bitflyer').first
  ticker = client.ticker(pair)
  ticker.base
  ticker.target
  ticker.last
```

### Query the Ticker stream API

```
  pair = client.pairs('bitfinex').first
  thread = client.ticker_stream(
    market_pair: pair,
    onopen: Proc.new { puts 'Opened!' },
    onmessage: Proc.new do |ticker|
                 puts ticker.base
                 puts ticker.target
                 puts ticker.last
                 # ...
               end,
    onclose: Proc.new { puts 'Closed!' },
  )

  thread.kill
```

### Query the OrderBook API

```
  # Check if exchange has support for OrderBook
  pair = client.pairs('bitbank').first
  order_book = client.order_book(pair)
  order_book.base
  order_book.target
  order_book.bids
  order_book.asks
```

### Query the OrderBook stream API

```
  pair = client.pairs('bitfinex').first
  thread = client.order_book_stream(
    market_pair: pair,
    onopen: Proc.new { puts 'Opened!' },
    onmessage: Proc.new do |order_book|
                 puts order_book.asks[0].price if order_book.asks[0]
                 puts order_book.bids[0].price if order_book.bids[0]
                 # ...
               end,
    onclose: Proc.new { puts 'Closed!' },
  )

  thread.kill
```

### Query the Trades API

```
  # Check if exchange has support for Trades
  # returns array

  pair = client.pairs('neraex').first
  trades = client.trades(pair)
  trades[0].base
  trades[0].target
  trades[0].price
  trades[0].amount
```

### Query the Trade stream API

```
  pair = client.pairs('bitfinex').first
  thread = client.trade_stream(
    market_pair: pair,
    onopen: Proc.new { puts 'Opened!' },
    onmessage: Proc.new do |trade|
                 puts trade.trade_id
                 puts trade.price
                 puts trade.amount
                 # ...
               end,
    onclose: Proc.new { puts 'Closed!' },
  )

  thread.kill
```

### Get Exchange Trade URL (Work in Progress)

```
  client.trade_page_url 'binance', base: 'BTC', target: 'USDT'

```


### Market List

Some exchange API do not support market pair listings. For those exchanges, we included
a custom YML file to define the list of market pairs supported by that exchange.
That configuration works out of the box, however if that exchange adds new market pairs,
you as the user of Cryptoexchange can explicitly add those pairs instead of waiting
for this library to be updated.

In the table above, look for the `User-Defined` under the Market List column.

The format of the yaml file should look like below.
Name the file <exchange_name>.yml and place it under the config/cryptoexchange directory.

```
  :pairs:
    - :base: BTC
      :target: KRW
    - :base: ETH
      :target: KRW
    - :base: ETC
      :target: KRW
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/coingecko/cryptoexchange. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

When implementing a new exchange for HTTP API, refer to this [guide](https://github.com/coingecko/cryptoexchange/wiki/Implementing-a-New-Exchange-(HTTP-API)).
For Websocket API, refer to this [guide](https://github.com/coingecko/cryptoexchange/wiki/Implementing-a-New-Exchange-(Websocket-API))

The [contributing guide](https://github.com/coingecko/cryptoexchange/blob/master/CONTRIBUTING.md) may also be useful to you.

You can chat with the core team member or other participating in this repository chat on [https://gitter.im/cryptoexchange-api/Lobby/~chat#](https://gitter.im/cryptoexchange-api/Lobby/~chat#)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
