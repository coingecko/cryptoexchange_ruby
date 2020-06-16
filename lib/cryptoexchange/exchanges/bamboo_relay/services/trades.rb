module Cryptoexchange::Exchanges
  module BambooRelay
    module Services
      class Trades < Cryptoexchange::Services::Market
        def fetch(market_pair)
          output = Cryptoexchange::Cache.ticker_cache.fetch(ticker_url(market_pair)) do
            HTTP.use(:auto_inflate).headers("Accept-Encoding" => "gzip").get(ticker_url(market_pair)).parse(:json)
          end
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::BambooRelay::Market::API_URL}/markets/#{market_pair.base}-#{market_pair.target}/fills"
        end

        def adapt(output, market_pair)
          output.collect do |trade|
            tr = Cryptoexchange::Models::Trade.new
            tr.trade_id  = trade['transactionHash']
            tr.base      = market_pair.base
            tr.target    = market_pair.target
            tr.type      = trade['side'] == "SELL" ? "sell" : "buy"
            tr.amount    = NumericHelper.to_d(trade['filledBaseTokenAmount'])
            tr.price     = NumericHelper.to_d(trade['filledQuoteTokenAmount']) / tr.amount
            tr.timestamp = trade['timestamp']
            tr.payload   = trade
            tr.market    = BambooRelay::Market::NAME
            tr
          end
        end
      end
    end
  end
end
