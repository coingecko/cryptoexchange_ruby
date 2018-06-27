module Cryptoexchange::Exchanges
  module Tokenomy
    module Services
      class Trades < Cryptoexchange::Services::Market
        def fetch(market_pair)
          output = super(ticker_url(market_pair))
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          base   = market_pair.base.downcase
          target = market_pair.target.downcase
          "#{Cryptoexchange::Exchanges::Tokenomy::Market::API_URL}/#{base}_#{target}/trades"
        end

        def adapt(output, market_pair)
          output.collect do |trade|
            tr = Cryptoexchange::Models::Trade.new
            tr.base      = market_pair.base
            tr.target    = market_pair.target
            tr.trade_id  = trade['tid']
            tr.type      = trade['type']
            tr.price     = trade['price']
            tr.amount    = trade['amount']
            tr.timestamp = trade['date'].to_i
            tr.payload   = trade
            tr.market    = Tokenomy::Market::NAME
            tr
          end
        end
      end
    end
  end
end
