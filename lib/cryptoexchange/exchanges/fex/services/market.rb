module Cryptoexchange::Exchanges
  module Fex
    module Services
      class Market < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            false
          end
        end

        def fetch
          output = super ticker_url
          adapt_all output
        end

        def ticker_url
          "#{Cryptoexchange::Exchanges::Fex::Market::API_URL}/market/ticker"
        end

        def adapt_all(output)
          output.map do |ticker|
            adapt(ticker)
          end
        end

        def adapt(output)
          base, target  = output['symbol'].split('/')
          ticker        = Cryptoexchange::Models::Ticker.new
          ticker.base   = base
          ticker.target = target
          ticker.market = Fex::Market::NAME
          ticker.ask    = NumericHelper.to_d(output['sell'])
          ticker.bid    = NumericHelper.to_d(output['buy'])
          # this is their typo
          ticker.last      = NumericHelper.to_d(output['colse'])
          ticker.volume    = NumericHelper.to_d(output['volume'])
          ticker.high      = NumericHelper.to_d(output['high'])
          ticker.low       = NumericHelper.to_d(output['low'])
          ticker.change    = NumericHelper.to_d(output['changePercentage'])
          ticker.timestamp = nil
          ticker.payload   = output
          ticker
        end
      end
    end
  end
end
