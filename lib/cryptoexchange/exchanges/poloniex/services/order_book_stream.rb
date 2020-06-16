module Cryptoexchange::Exchanges
  module Poloniex
    module Services
      class OrderBookStream < Cryptoexchange::Services::OrderBookStream
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
          order_book        = Cryptoexchange::Models::OrderBook.new
          order_book.base   = market_pair.base
          order_book.target = market_pair.target
          order_book.market = Poloniex::Market::NAME
           if message[3] > 0
            order_book.bids = adapt_orders(message)
          else
            order_book.asks = adapt_orders(message)
          end
           order_book.timestamp = nil
          order_book.payload   = message
          order_book
        end
         private
         def adapt_orders(message)
          [
            Cryptoexchange::Models::Order.new(
              price: message[1],
              amount: message[3].abs,
              timestamp: nil
            )
          ]
        end
      end
    end
  end
end
