require 'spec_helper'

RSpec.describe 'Upbit integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:eth_krw_pair) { Cryptoexchange::Models::MarketPair.new(base: 'eth', target: 'krw', market: 'upbit') }

  it 'fetch pairs' do
    pairs = client.pairs('upbit')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'upbit'
  end

  it 'fetch ticker' do
    ticker = client.ticker(eth_krw_pair)

    expect(ticker.base).to eq 'ETH'
    expect(ticker.target).to eq 'KRW'
    expect(ticker.market).to eq 'upbit'
    expect(ticker.last).to be_a Numeric
    expect(ticker.high).to be_a Numeric
    expect(ticker.low).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(ticker.timestamp).to be_a Numeric
    expect(2000..Date.today.year).to include(Time.at(ticker.timestamp).year)
    expect(ticker.payload).to_not be nil
  end
  # it 'fetch trade' do
  #   trades = client.trades(eth_krw_pair)
  #   trade = trades.sample
  #
  #   expect(trades).to_not be_empty
  #   expect(trade.base).to eq 'ETH'
  #   expect(trade.target).to eq 'KRW'
  #   expect(trade.market).to eq 'upbit'
  #   expect(trade.trade_id).to_not be_nil
  #   expect(['buy', 'sell']).to include trade.type
  #   expect(trade.price).to_not be_nil
  #   expect(trade.amount).to_not be_nil
  #   expect(trade.timestamp).to be_a Numeric
  #   expect(trade.payload).to_not be nil
  # end
end
