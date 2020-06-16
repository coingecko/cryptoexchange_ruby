require 'spec_helper'

RSpec.describe 'Excoincial integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:afcash_eth_pair) { Cryptoexchange::Models::MarketPair.new(base: 'AFCASH', target: 'ETH', market: 'excoincial') }

  it 'fetch pairs' do
    pairs = client.pairs('excoincial')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).not_to be_nil
    expect(pair.target).not_to be_nil
    expect(pair.market).to eq 'excoincial'
  end

  it 'fetch ticker' do
    ticker = client.ticker(afcash_eth_pair)

    expect(ticker.base).to eq 'AFCASH'
    expect(ticker.target).to eq 'ETH'
    expect(ticker.market).to eq 'excoincial'
    expect(ticker.bid).to be_a Numeric
    expect(ticker.ask).to be_a Numeric
    expect(ticker.high).to be_a Numeric
    expect(ticker.low).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(ticker.last).to be_a Numeric
    expect(ticker.timestamp).to be nil
    expect(ticker.payload).to_not be nil
  end

  it 'fetch order book' do
    order_book = client.order_book(afcash_eth_pair)

    expect(order_book.base).to eq 'AFCASH'
    expect(order_book.target).to eq 'ETH'
    expect(order_book.market).to eq 'excoincial'
    expect(order_book.asks).to_not be_empty
    expect(order_book.bids).to_not be_empty
    expect(order_book.asks.first.price).to_not be_nil
    expect(order_book.bids.first.amount).to_not be_nil
    expect(order_book.bids.first.timestamp).to be nil
    expect(order_book.timestamp).to be_a Numeric
    expect(order_book.payload).to_not be nil
  end

  it 'fetch trade' do
    trades = client.trades(afcash_eth_pair)
    trade  = trades.sample

    expect(trades).to_not be_empty
    expect(trade.trade_id).to_not be_nil
    expect(trade.base).to eq 'AFCASH'
    expect(trade.target).to eq 'ETH'
    expect(trade.price).to_not be_nil
    expect(trade.amount).to_not be_nil
    expect(trade.timestamp).to be_a Numeric
    expect(trade.payload).to_not be nil
    expect(trade.market).to eq 'excoincial'
  end
end
