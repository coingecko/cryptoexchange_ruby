require 'spec_helper'

RSpec.describe 'Amoveo integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:veo_eth_pair) { Cryptoexchange::Models::MarketPair.new(base: 'VEO', target: 'ETH', market: 'amoveo') }

  it 'fetch pairs' do
    pairs = client.pairs('amoveo')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'amoveo'
  end

  it 'fetch ticker' do
    ticker = client.ticker(veo_eth_pair)

    expect(ticker.base).to eq 'VEO'
    expect(ticker.target).to eq 'ETH'
    expect(ticker.market).to eq 'amoveo'
    expect(ticker.last).to be_a Numeric
    expect(ticker.low).to be_a Numeric
    expect(ticker.high).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(ticker.timestamp).to be_a Numeric
    expect(2000..Date.today.year).to include(Time.at(ticker.timestamp).year)
    expect(ticker.payload).to_not be nil
  end

  # it 'fetch order book' do
  #   order_book = client.order_book(veo_eth_pair)
  #
  #   expect(order_book.base).to eq 'VEO'
  #   expect(order_book.target).to eq 'ETH'
  #   expect(order_book.market).to eq 'amoveo'
  #   expect(order_book.asks).to_not be_empty
  #   expect(order_book.bids).to_not be_empty
  #   expect(order_book.asks.first.price).to_not be_nil
  #   expect(order_book.bids.first.amount).to_not be_nil
  #   expect(order_book.bids.first.timestamp).to be_nil
  #   expect(order_book.asks.count).to be > 10
  #   expect(order_book.bids.count).to be > 10
  #   expect(order_book.timestamp).to be_a Numeric
  #   expect(order_book.payload).to_not be nil
  # end
  #
  # it 'fetch trade' do
  #   trades = client.trades(veo_eth_pair)
  #   trade = trades.sample
  #
  #   expect(trades).to_not be_empty
  #   expect(trade.base).to eq 'VEO'
  #   expect(trade.target).to eq 'ETH'
  #   expect(trade.market).to eq 'amoveo'
  #   expect(trade.trade_id).to_not be_nil
  #   expect(['buy', 'sell']).to include trade.type
  #   expect(trade.price).to_not be_nil
  #   expect(trade.amount).to_not be_nil
  #   expect(trade.timestamp).to be_a Numeric
  #   expect(trade.payload).to_not be nil
  # end
end
