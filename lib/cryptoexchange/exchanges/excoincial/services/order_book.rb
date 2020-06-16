module Cryptoexchange::Exchanges
  module Excoincial
    module Services
      class OrderBook < Cryptoexchange::Services::Market
        PAIRS_URL = "#{Cryptoexchange::Exchanges::Excoincial::Market::API_URL}/markets"
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
          output = super(ticker_url(market_pair))
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::Excoincial::Market::API_URL}/depth?market=#{market_pair.base.downcase}#{market_pair.target.downcase}"
        end

        def adapt(output, market_pair)
          order_book = Cryptoexchange::Models::OrderBook.new

          order_book.base      = market_pair.base
          order_book.target    = market_pair.target
          order_book.market    = Excoincial::Market::NAME
          order_book.asks      = adapt_orders(output['asks'].to_a)
          order_book.bids      = adapt_orders(output['bids'].to_a)
          order_book.timestamp = output['timestamp']
          order_book.payload   = output
          order_book
        end

        def adapt_orders(orders)
          orders.collect do |order_entry|
            Cryptoexchange::Models::Order.new(price: NumericHelper.to_d(order_entry[0]),
                                              amount: NumericHelper.to_d(order_entry[1]),
                                              timestamp: nil)
          end
        end
      end
    end
  end
end
