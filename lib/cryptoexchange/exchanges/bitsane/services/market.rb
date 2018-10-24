module Cryptoexchange::Exchanges
  module Bitsane
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
          "#{Cryptoexchange::Exchanges::Bitsane::Market::API_URL}/ticker"
        end

        def adapt_all(output)
          output.map do |pair|
            base, target = pair[0].split('_')
            market_pair = Cryptoexchange::Models::MarketPair.new(
                            base: base,
                            target: target,
                            market: Bitsane::Market::NAME
                          )
            adapt(market_pair, pair[1])
          end
        end

        def adapt(market_pair, output)
          ticker = Cryptoexchange::Models::Ticker.new
          ticker.base = market_pair.base
          ticker.target = market_pair.target
          ticker.market = Bitsane::Market::NAME
          ticker.last = NumericHelper.to_d(output['last'])
          ticker.bid = NumericHelper.to_d(output['highestBid'])
          ticker.ask = NumericHelper.to_d(output['lowestAsk'])
          ticker.high = NumericHelper.to_d(output['high24hr'])
          ticker.low = NumericHelper.to_d(output['low24hr'])
          ticker.volume = NumericHelper.to_d(output['baseVolume'])
          ticker.change = NumericHelper.to_d(output['percentChange'])
          ticker.timestamp = nil
          ticker.payload = output
          ticker
        end
      end
    end
  end
end
