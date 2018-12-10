module Cryptoexchange::Exchanges
  module Huulk
    module Services
      class Pairs < Cryptoexchange::Services::Pairs

        def fetch
          output = super
          adapt(output)
        end

        def adapt(output)
          market_pairs = []
          output.each do |pair|
            market_pairs << Cryptoexchange::Models::MarketPair.new(
                              base: pair[:base],
                              target: pair[:target],
                              market: Huulk::Market::NAME
                            )
          end
          market_pairs
        end
      end
    end
  end
end
