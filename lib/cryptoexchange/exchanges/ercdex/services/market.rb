module Cryptoexchange::Exchanges
  module Ercdex
    module Services
      class Market < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
          # call IdFetcher to obtain base, target, base volume, bid, and ask
          pair_id = IdFetcher.get_id(market_pair.base.upcase, market_pair.target.upcase)
          base = pair_id[0]["tokenPair"]["tokenA"]["address"]
          target = pair_id[0]["tokenPair"]["tokenB"]["address"]
          raw_output = HTTP.post(ticker_url, :json => { :baseTokenAddress=>"#{base}",:quoteTokenAddress=>"#{target}",:networkId=>1,:startDate=>"#{(Time.now - 1200).utc.iso8601}" })
          output = JSON.parse(raw_output)
          adapt(output.last, pair_id, market_pair)
        end

        def ticker_url
          "#{Cryptoexchange::Exchanges::Ercdex::Market::API_URL}/reports/historical"
        end

        def adapt(output, pair_id, market_pair)
          ticker = Cryptoexchange::Models::Ticker.new
          ticker.base      = market_pair.base
          ticker.target    = market_pair.target
          ticker.market    = Ercdex::Market::NAME
          ticker.ask       = NumericHelper.to_d(pair_id[0]['ask'])
          ticker.bid       = NumericHelper.to_d(pair_id[0]['bid'])
          ticker.last      = NumericHelper.to_d(output['close'])
          ticker.high      = NumericHelper.to_d(output['high'])
          ticker.low       = NumericHelper.to_d(output['low'])
          ticker.volume    = NumericHelper.to_d(pair_id[0]['tokenPair']['baseVolume'])
          ticker.timestamp = nil
          ticker.payload   = output,pair_id
          ticker
        end
      end
    end
  end
end
