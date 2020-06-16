module Cryptoexchange::Exchanges
  module BambooRelay
    module Services
      class OrderBook < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
          output = Cryptoexchange::Cache.ticker_cache.fetch(ticker_url(market_pair)) do
            HTTP.use(:auto_inflate).headers("Accept-Encoding" => "gzip").get(ticker_url(market_pair)).parse(:json)
          end
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::BambooRelay::Market::API_URL}/markets/#{market_pair.base}-#{market_pair.target}/book"
        end

        def adapt(output, market_pair)
          order_book = Cryptoexchange::Models::OrderBook.new
          order_book.base      = market_pair.base
          order_book.target    = market_pair.target
          order_book.market    = BambooRelay::Market::NAME
          order_book.asks      = adapt_orders(output['asks'])
          order_book.bids      = adapt_orders(output['bids'])
          order_book.timestamp = nil
          order_book.payload   = output
          order_book
        end

        def adapt_orders(orders)
          orders.collect do |order_entry|
            Cryptoexchange::Models::Order.new(
              price: NumericHelper.to_d(order_entry["price"]),
              amount: NumericHelper.to_d(order_entry["remainingBaseTokenAmount"])
            )
          end
        end
      end
    end
  end
end
