require 'spec_helper'

RSpec.describe 'P2pb2b integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:market) { 'p2pb2b' }
  let(:btc_usd_pair) do
    Cryptoexchange::Models::MarketPair.new(base: 'BTC', target: 'USD', market: market)
  end

  it 'fetch pairs' do
    pairs = client.pairs(market)
    expect(pairs).not_to be_empty
    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq market
  end


  it 'fetch ticker' do
    ticker = client.ticker(btc_usd_pair)

    expect(ticker.base).to eq 'BTC'
    expect(ticker.target).to eq 'USD'
    expect(ticker.market).to eq market
    expect(ticker.last).to be_a Numeric
    expect(ticker.low).to be_a Numeric
    expect(ticker.bid).to be_a Numeric
    expect(ticker.ask).to be_a Numeric
    expect(ticker.high).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(ticker.timestamp).to be_a Numeric
    expect(ticker.payload).to_not be nil
  end
end
