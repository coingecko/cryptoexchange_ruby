module Cryptoexchange::Exchanges
  module BambooRelay
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::BambooRelay::Market::API_URL}/markets"

        def fetch
          market_pairs = []
          raw_output = HTTP.use(:auto_inflate).headers("Accept-Encoding" => "gzip").get(PAIRS_URL + "?perPage=1000")
          output = JSON.parse(raw_output)
          output.each do |ticker|
            base, target = ticker['displayName'].split('/')
              market_pairs << Cryptoexchange::Models::MarketPair.new(
                base:   base,
                target: target,
                market: BambooRelay::Market::NAME
            )
          end
          market_pairs
        end
      end
    end
  end
end
