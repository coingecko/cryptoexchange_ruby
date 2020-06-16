module Cryptoexchange::Exchanges
  module Ercdex
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Ercdex::Market::API_URL}/token-pair-summaries/1"

        def fetch
          output = super
          adapt(output)
        end

        def adapt(output)
          market_pairs = []
          output.each do |pair|

            market_pairs << Cryptoexchange::Models::MarketPair.new(
                              base: pair["tokenPair"]["tokenA"]["symbol"],
                              target: pair["tokenPair"]["tokenB"]["symbol"],
                              market: Ercdex::Market::NAME
                            )
          end
          market_pairs
        end
      end
    end
  end
end
