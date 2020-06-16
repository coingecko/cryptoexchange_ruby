module Cryptoexchange::Exchanges
  module Zooomex
    module Services
      class Market < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
	  ctx = OpenSSL::SSL::SSLContext.new
          ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
          result = HTTP.get(ticker_url(market_pair), ssl_context: ctx)
          output = JSON.parse(result)
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::Zooomex::Market::API_URL}/public/markets/#{market_pair.inst_id}/tickers"
        end

        def adapt(output, market_pair)
          ticker = Cryptoexchange::Models::Ticker.new
          market = output

          ticker           = Cryptoexchange::Models::Ticker.new
          ticker.base      = market_pair.base
          ticker.target    = market_pair.target
          ticker.market    = Zooomex::Market::NAME
          ticker.last      = NumericHelper.to_d(market['last'])
          ticker.bid       = NumericHelper.to_d(market['buy'])
          ticker.ask       = NumericHelper.to_d(market['sell'])
          ticker.high      = NumericHelper.to_d(market['high'])
          ticker.low       = NumericHelper.to_d(market['low'])
          ticker.volume    = NumericHelper.to_d(market['volume'])
          ticker.timestamp = nil
          ticker.payload   = output
          ticker
        end
      end
    end
  end
end
