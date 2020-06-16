module Cryptoexchange::Exchanges
  module Excoincial
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
          "#{Cryptoexchange::Exchanges::Excoincial::Market::API_URL}/tickers"
        end

        def adapt_all(output)
          pairs_map = {}
          pairs = Cryptoexchange::Exchanges::Excoincial::Services::Pairs.new.fetch
          pairs.each do |m|
            pairs_map["#{m.base.downcase}#{m.target.downcase}"] = m
          end

          output.map do |output|
            market_pair = pairs_map.fetch output.first
            adapt(market_pair, output[1]['ticker'], output[1]['at'])
          end
        end

        def adapt(market_pair, output, at)
          ticker           = Cryptoexchange::Models::Ticker.new
          ticker.base      = market_pair.base
          ticker.target    = market_pair.target
          ticker.market    = market_pair.market
          ticker.last      = NumericHelper.to_d(output['last'].to_f)
          ticker.high      = NumericHelper.to_d(output['high'].to_f)
          ticker.low       = NumericHelper.to_d(output['low'].to_f)
          ticker.bid       = NumericHelper.to_d(output['buy'].to_f)
          ticker.ask       = NumericHelper.to_d(output['sell'].to_f)
          ticker.volume    = NumericHelper.to_d(output['volume'].to_f)
          ticker.timestamp = at.to_i
          ticker.payload   = output
          ticker
        end

        private

        def split(pair)
          {
            base: pair.split('/').first,
            target: pair.split('/').last
          }
        end
      end
    end
  end
end
