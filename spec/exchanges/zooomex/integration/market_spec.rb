require 'spec_helper'

RSpec.describe 'Zooomex integration specs' do
  let(:client) { Cryptoexchange::Client.new }
  let(:market) { 'zooomex' }
  let(:btc_usdt_pair) do
    Cryptoexchange::Models::MarketPair.new(base: 'BTC', target: 'USDT', market: market, inst_id: 'btcusdt')
  end

  it 'fetch pairs' do
    pairs = client.pairs('zooomex')
    expect(pairs).not_to be_empty

    pair = pairs.first
    expect(pair.base).to_not be nil
    expect(pair.target).to_not be nil
    expect(pair.market).to eq 'zooomex'
  end

  it 'give trade url' do
    trade_page_url = client.trade_page_url market, base: btc_usdt_pair.base, target: btc_usdt_pair.target, inst_id: btc_usdt_pair.inst_id
    expect(trade_page_url).to eq "https://www.zooomex.com/exchange/#{btc_usdt_pair.base}-#{btc_usdt_pair.target}"
  end

  it 'fetch ticker' do
    ticker = client.ticker(btc_usdt_pair)

    expect(ticker.base).to eq 'BTC'
    expect(ticker.target).to eq 'USDT'
    expect(ticker.market).to eq market
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
    order_book = client.order_book(btc_usdt_pair)

    expect(order_book.base).to eq 'BTC'
    expect(order_book.target).to eq 'USDT'
    expect(order_book.market).to eq 'zooomex'

    expect(order_book.timestamp).to_not be nil
    expect(order_book.payload).to_not be nil
  end

  it 'fetch trade' do
    trades = client.trades(btc_usdt_pair)

    trade = trades.sample
    expect(trades).to_not be_empty
    expect(trade.base).to eq 'BTC'
    expect(trade.target).to eq 'USDT'
    expect(trade.market).to eq 'zooomex'
    expect(['buy', 'sell']).to include trade.type
    expect(trade.price).to_not be_nil
    expect(trade.amount).to_not be_nil
    expect(trade.timestamp).to be_a Numeric
    expect(trade.payload).to_not be nil
  end
end
