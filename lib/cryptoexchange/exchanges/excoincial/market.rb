module Cryptoexchange::Exchanges
  module Excoincial
    class Market < Cryptoexchange::Models::Market
      NAME = 'excoincial'
      API_URL = 'https://excoincial.com/api/v2'

      def self.trade_page_url(args={})
        "https://excoincial.com/trading/#{args[:base]}#{args[:target]}"
      end
    end
  end
end
