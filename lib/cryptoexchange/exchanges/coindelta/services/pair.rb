module Cryptoexchange::Exchanges
    module Coindelta
      module Services
        class Pairs < Cryptoexchange::Services::Pairs
          PAIRS_URL = "#{Cryptoexchange::Exchanges::Coindelta::Market::API_URL}/pricetickers/"

          def fetch
            output = super
            adapt(output)
          end

          def adapt(output)
            market_pairs = []
            output.map do |pair, ticker|
              next unless ticker['isFrozen'] == '0'
              target, base = pair.split('_')
              market_pairs << Cryptoexchange::Models::MarketPair.new(
                                base: base,
                                target: target,
                                market: Coindelta::Market::NAME
                              )
            end
            market_pairs
          end
        end
      end
    end
end
