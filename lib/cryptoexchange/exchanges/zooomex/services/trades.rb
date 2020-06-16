module Cryptoexchange::Exchanges
  module Zooomex
    module Services
      class Trades < Cryptoexchange::Services::Market

        def fetch(market_pair)
	  ctx = OpenSSL::SSL::SSLContext.new
          ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
          result = HTTP.get(trades_url(market_pair), ssl_context: ctx)
          output = JSON.parse(result)
          adapt(output, market_pair)
        end

        def trades_url(market_pair)
	  "#{Cryptoexchange::Exchanges::Zooomex::Market::API_URL}/public/markets/#{market_pair.inst_id}/trades"
        end

	def adapt(output, market_pair)
          output.collect do |trade|
            tr = Cryptoexchange::Models::Trade.new
            tr.trade_id  = trade['id']
            tr.base      = market_pair.base
            tr.target    = market_pair.target
            tr.type      = trade['taker_type'] == 'buy' ? 'buy' : 'sell'
            tr.price     = trade['price']
            tr.amount    = trade['volume']
            tr.timestamp = DateTime.parse(trade['created_at']).strftime("%s").to_i
            tr.payload   = trade
            tr.market    = Zooomex::Market::NAME
            tr
          end
        end

      end
    end
  end
end
