module Cryptoexchange::Exchanges
  module Poloniex
    module Services
      class MarketStream < Cryptoexchange::Services::MarketStream
        def url
          Cryptoexchange::Exchanges::Poloniex::Market::WS_URL
        end
         def subscribe_event(market_pair)
          {
            command: "subscribe",
            channel: 1002
          }.to_json
        end
         def valid_message?(message)
          message.is_a?(Array) && message.length >=1
        end
         def parse_message(message, market_pair)
          ticker           = Cryptoexchange::Models::Ticker.new
          ticker.base      = market_pair.base
          ticker.target    = market_pair.target
          ticker.market    = Poloniex::Market::NAME
          ticker.ask       = NumericHelper.to_d(message[2])
          ticker.bid       = NumericHelper.to_d(message[3])
          ticker.last      = NumericHelper.to_d(message[1])
          ticker.high      = NumericHelper.to_d(message[8])
          ticker.low       = NumericHelper.to_d(message[9])
          ticker.volume    = NumericHelper.to_d(message[6])
          ticker.timestamp = nil
          ticker.payload   = message
          ticker
        end
      end
    end
  end
end
