module Cryptoexchange::Exchanges
  module Fyrus
    module Services
      class Market < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            false
          end
        end

        def fetch
          output = super(ticker_url)
          adapt_all(output)
        end

        def ticker_url
          "#{Cryptoexchange::Exchanges::Fyrus::Market::API_URL}/symbols"
        end

        def adapt_all(output)
          output['data'].map do |pair|
            base, target = pair[0].split('_')
            market_pair = Cryptoexchange::Models::MarketPair.new(
                            base: base.upcase,
                            target: target.upcase,
                            market: Fyrus::Market::NAME
                          )
            adapt(market_pair, pair)
          end
        end

        def adapt(market_pair, output)
          ticker = Cryptoexchange::Models::Ticker.new
          ticker.base = market_pair.base
          ticker.target = market_pair.target
          ticker.market = Fyrus::Market::NAME
          ticker.last = NumericHelper.to_d(output[1]['price'])
          ticker.volume = NumericHelper.to_d(output[1]['baseVolume'])
          ticker.timestamp = nil
          ticker.payload = output
          ticker
        end
      end
    end
  end
end
