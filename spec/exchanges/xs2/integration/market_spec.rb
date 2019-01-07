require 'spec_helper'

RSpec.describe 'XS2 integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:eth_btc_pair) { Cryptoexchange::Models::MarketPair.new(base: 'ETH', target: 'BTC', market: 'xs2') }

  it 'get trade-page url' do
    trade_url = client.trade_page_url 'xs2', { base: eth_btc_pair.base, target: eth_btc_pair.target }
	expect(trade_url).to eq 'https://xs2.exchange/trade/ETH/BTC'
  end

  it 'fetch pairs' do
    pairs = client.pairs('xs2')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'xs2'
  end

  it 'fetch ticker' do
    ticker = client.ticker(eth_btc_pair)

    expect(ticker.base).to eq 'ETH'
    expect(ticker.target).to eq 'BTC'
    expect(ticker.market).to eq 'xs2'
    expect(ticker.last).to be_a Numeric
    expect(ticker.ask).to be_a Numeric
    expect(ticker.bid).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(2018..Date.today.year).to include(Time.at(ticker.timestamp).year)
    expect(ticker.payload).to_not be nil
  end

  it 'fetch order book' do
    order_book = client.order_book(eth_btc_pair)

    expect(order_book.base).to eq 'ETH'
    expect(order_book.target).to eq 'BTC'
    expect(order_book.market).to eq 'xs2'
    expect(order_book.timestamp).to be nil
    expect(order_book.asks).to_not be_empty
    expect(order_book.asks.count).to be > 0
    expect(order_book.asks.first.price).to be_a Numeric
    expect(order_book.asks.first.amount).to be_a Numeric
    expect(order_book.bids).to_not be_empty
    expect(order_book.bids.count).to be > 0
    expect(order_book.bids.first.price).to be_a Numeric
    expect(order_book.bids.first.amount).to be_a Numeric
    expect(order_book.payload).to_not be nil
  end

  it 'fetch trade' do
    trades = client.trades(eth_btc_pair)
    trade = trades.sample

    expect(trades).to_not be_empty
    expect(trade.trade_id).to_not be nil
    expect(trade.base).to eq 'ETH'
    expect(trade.target).to eq 'BTC'
    expect(['buy', 'sell']).to include trade.type
    expect(trade.price).to be_a Numeric
    expect(trade.amount).to be_a Numeric
    expect(2018..Date.today.year).to include(Time.at(trade.timestamp).year)
    expect(trade.payload).to_not be nil
    expect(trade.market).to eq 'xs2'
  end

end
