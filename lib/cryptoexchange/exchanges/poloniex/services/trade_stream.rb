module Cryptoexchange::Exchanges
  module Poloniex
    module Services
      class TradeStream < Cryptoexchange::Services::TradeStream
        def url
          Cryptoexchange::Exchanges::Poloniex::Market::WS_URL
        end
         def subscribe_event(market_pair)
          {
            command: "subscribe",
            channel: 1010
          }.to_json
        end
         def valid_message?(message)
          message.is_a?(Array) && message.length >=1
        end
         def parse_message(message, market_pair)
          trade           = Cryptoexchange::Models::Trade.new
          trade.base      = market_pair.base
          trade.target    = market_pair.target
          trade.market    = Poloniex::Market::NAME
          trade.trade_id  = message[3]
          trade.type      = message[6] > 0 ? 'buy' : 'sell' # The order that causes the trade determines if it is a buy or a sell.
          trade.price     = message[5]
          trade.amount    = message[6]
          trade.timestamp = message[4]
          trade.payload   = message
           trade
        end
      end
    end
  end
end
