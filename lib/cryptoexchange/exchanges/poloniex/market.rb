module Cryptoexchange::Exchanges
  module Poloniex
    class Market < Cryptoexchange::Models::Market
      NAME = 'poloniex'
      API_URL = 'https://poloniex.com/public'
      WS_URL = 'wss://api2.poloniex.com'

      def self.trade_page_url(args={})
        "https://poloniex.com/exchange##{args[:base].downcase}_#{args[:target].downcase}"
      end
    end
  end
end
