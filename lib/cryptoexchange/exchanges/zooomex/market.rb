module Cryptoexchange::Exchanges
  module Zooomex
    class Market < Cryptoexchange::Models::Market
      NAME = 'zooomex'
      API_URL = 'https://www.zooomex.com/api/v2/trade'

      def self.trade_page_url(args={})
        "https://www.zooomex.com/exchange/#{args[:base]}-#{args[:target]}"
      end
    end
  end
end
