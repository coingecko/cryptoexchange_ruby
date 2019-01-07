module Cryptoexchange::Exchanges
  module Xs2
    module Services
      class Market < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            false
          end
        end

        def fetch
          output = super ticker_url
          adapt_all(output)
        end

        def ticker_url
          "#{Cryptoexchange::Exchanges::Xs2::Market::API_URL}/Get24HrSummaries"
        end

		def adapt_all(output)
          output['data'].map do |label, summary|
		    symbols = label.split('/')
            market_pair = Cryptoexchange::Models::MarketPair.new(
                              base: symbols[0],
                              target: symbols[1],
                              market: Xs2::Market::NAME
                            )
            adapt(summary, market_pair)
		  end
		end

        def adapt(summary, market_pair)
          ticker           = Cryptoexchange::Models::Ticker.new
          ticker.base      = market_pair.base
          ticker.target    = market_pair.target
          ticker.market    = Xs2::Market::NAME
          ticker.bid       = NumericHelper.to_d(summary['buy'])
          ticker.ask       = NumericHelper.to_d(summary['sell'])
          ticker.last      = NumericHelper.to_d(summary['price'])
          ticker.high      = NumericHelper.to_d(summary['high'] != nil ? summary['high'] : summary['price'])
          ticker.low       = NumericHelper.to_d(summary['low'] != nil ? summary['low'] : summary['price'])
          ticker.volume    = NumericHelper.to_d(summary['volume'])
          ticker.timestamp = Time.parse(summary['utc']).to_i
          ticker.payload   = summary
          ticker
        end
      end
    end
  end
end
