module Cryptoexchange::Exchanges
  module Xs2
    module Services
      class Trades < Cryptoexchange::Services::Market
	    TRADE_TYPE = {
          'B' => 'buy',
          'S' => 'sell'
        }.freeze

        def fetch(market_pair)
          output = super(ticker_url(market_pair))
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::Xs2::Market::API_URL}/GetHistoricTrades?Market=#{market_pair.base}/#{market_pair.target}"
        end

        def adapt(output, market_pair)
          output['data'].collect do |trade|
            tr = Cryptoexchange::Models::Trade.new
            tr.trade_id  = trade['id']
            tr.base      = market_pair.base
            tr.target    = market_pair.target
            tr.type      = TRADE_TYPE[trade['side']]
            tr.price     = trade['rate']
            tr.amount    = trade['amount']
            tr.timestamp = Time.parse(trade['created']).to_i
            tr.payload   = trade
            tr.market    = Xs2::Market::NAME
            tr
          end
        end
      end
    end
  end
end
