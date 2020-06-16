module Cryptoexchange::Exchanges
  module Zooomex
    module Services
      class Pairs < Cryptoexchange::Services::Pairs
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Zooomex::Market::API_URL}/public/markets"

        def fetch
          ctx = OpenSSL::SSL::SSLContext.new
          ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
          result = HTTP.get(PAIRS_URL, ssl_context: ctx)
          output = JSON.parse(result)
          adapt(output)
        end

        def adapt(output)
          market_pairs = []
          output.each do |pair|
            base = pair["base_unit"]
            target = pair["quote_unit"]
	    id_market = pair["id"]
            next unless base && target
            market_pairs << Cryptoexchange::Models::MarketPair.new(
                              base: base,
                              target: target,
                              market: Zooomex::Market::NAME,
			      inst_id: id_market
                            )
          end
          market_pairs
        end
      end
    end
  end
end

