module Cryptoexchange::Exchanges
  module BambooRelay
    module Services
      class Market < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            false
          end
        end

        def fetch
          output = Cryptoexchange::Cache.ticker_cache.fetch(ticker_url()) do
            HTTP.use(:auto_inflate).headers("Accept-Encoding" => "gzip").get(ticker_url()).parse(:json)
          end
          adapt_all(output)
        end

        def ticker_url()
          "#{Cryptoexchange::Exchanges::BambooRelay::Market::API_URL}/markets?include=base,stats,ticker,realVolume&perPage=1000"
        end

        def adapt_all(output)
          output.map do |pair_ticker|
            base, target = pair_ticker["displayName"].split("/")
            market_pair = Cryptoexchange::Models::MarketPair.new(
              base:   base,
              target: target,
              market: BambooRelay::Market::NAME
            )
            adapt(market_pair, pair_ticker["ticker"], pair_ticker["stats"])
          end
        end

        def adapt(market_pair, ticker_output, stats_output)
          ticker = Cryptoexchange::Models::Ticker.new

          ticker.base      = market_pair.base
          ticker.target    = market_pair.target
          ticker.market    = BambooRelay::Market::NAME
          ticker.bid       = NumericHelper.to_d(ticker_output['bestBid'])
          ticker.ask       = NumericHelper.to_d(ticker_output['bestAsk'])
          ticker.last      = NumericHelper.to_d(ticker_output['price'])
          vol = NumericHelper.to_d(stats_output['volume24Hour'])
          ticker.volume    = (vol.nil? || vol == "") ? 0 : NumericHelper.divide(vol, ticker.last)
          ticker.change    = NumericHelper.to_d(stats_output['percentChange24Hour'])
          ticker.timestamp = nil
          ticker.payload   = [ticker_output, stats_output]
          ticker
        end
      end
    end
  end
end
