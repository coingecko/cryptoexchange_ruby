require 'spec_helper'

RSpec.describe 'Coindelta integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:btc_inr_pair) { Cryptoexchange::Models::MarketPair.new(base: 'BTC', target: 'INR', market: 'coindelta') }

  it 'fetch pairs' do
    pairs = client.pairs('coindelta')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'coindelta'
  end

  it 'fetch ticker' do
    ticker = client.ticker(btc_inr_pair)

    expect(ticker.base).to eq 'BTC'
    expect(ticker.target).to eq 'INR'
    expect(ticker.market).to eq 'coindelta'
    expect(ticker.last).to be_a Numeric
    expect(ticker.bid).to be_a Numeric
    expect(ticker.ask).to be_a Numeric
    expect(ticker.high).to be_a Numeric
    expect(ticker.volume).to be_a Numeric
    expect(ticker.timestamp).to be nil

    expect(ticker.payload).to_not be nil
  end
end
