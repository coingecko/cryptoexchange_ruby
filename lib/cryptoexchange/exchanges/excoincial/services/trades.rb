module Cryptoexchange::Exchanges
  module Excoincial
    module Services
      class Trades < Cryptoexchange::Services::Market

        def fetch(market_pair)
          output = super(ticker_url(market_pair))
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::Excoincial::Market::API_URL}/trades?market=#{market_pair.base.downcase}#{market_pair.target.downcase}"
        end

        def adapt(output, market_pair)
          output.collect do |trade|
            tr = Cryptoexchange::Models::Trade.new
            tr.trade_id  = trade['id']
            tr.base      = market_pair.base
            tr.target    = market_pair.target
            tr.type      = trade['maker_type']
            tr.price     = NumericHelper.to_d(trade['price'])
            tr.amount    = NumericHelper.to_d(trade['volume'])

            timestamp = DateTime.iso8601(trade['created_at'])
                                .to_time
                                .to_i

            tr.timestamp = timestamp #DateTime.parse(trade['created_at']).to_time.to_i
            tr.payload   = trade
            tr.market    = Excoincial::Market::NAME
            tr
          end
        end
      end
    end
  end
end
