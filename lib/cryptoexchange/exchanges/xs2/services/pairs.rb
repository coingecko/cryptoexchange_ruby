module Cryptoexchange::Exchanges
  module Xs2
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Xs2::Market::API_URL}/Get24HrSummaries"

        def fetch
          output = super
          adapt(output)
        end

        def adapt(output)
          market_pairs = []
          output['data'].keys.each do |label|
		    symbols = label.split('/')
            market_pairs << Cryptoexchange::Models::MarketPair.new(
                              base: symbols[0],
                              target: symbols[1],
                              market: Xs2::Market::NAME
                            )
          end
          market_pairs
        end
      end
    end
  end
end
