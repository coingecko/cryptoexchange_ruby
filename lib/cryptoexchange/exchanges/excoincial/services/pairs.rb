module Cryptoexchange::Exchanges
  module Excoincial
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Excoincial::Market::API_URL}/markets"

        def fetch
          output = super
          adapt(output)
        end

        def adapt(output)
          output.map do |output|
            pair = split(output['name'])
            Cryptoexchange::Models::MarketPair.new(
              base: pair[:base],
              target: pair[:target],
              market: Excoincial::Market::NAME
            )
          end
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



