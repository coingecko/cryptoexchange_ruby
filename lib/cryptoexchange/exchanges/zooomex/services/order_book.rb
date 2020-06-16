module Cryptoexchange::Exchanges
  module Zooomex
    module Services
      class OrderBook < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
	  ctx = OpenSSL::SSL::SSLContext.new
          ctx.verify_mode = OpenSSL::SSL::VERIFY_NONE
          result = HTTP.get(order_book_url(market_pair), ssl_context: ctx)
          output = JSON.parse(result)
          adapt(output, market_pair)
        end

        def order_book_url(market_pair)
	  "#{Cryptoexchange::Exchanges::Zooomex::Market::API_URL}/public/markets/#{market_pair.inst_id}/depth"
        end

        def adapt(output, market_pair)
          order_book = Cryptoexchange::Models::OrderBook.new
          order_book.base      = market_pair.base
          order_book.target    = market_pair.target
          order_book.market    = Zooomex::Market::NAME
          order_book.asks      = adapt_orders output['asks']
          order_book.bids      = adapt_orders output['bids']
          order_book.timestamp = output['timestamp']
          order_book.payload   = output
          order_book
        end

        def adapt_orders(orders)
          orders.collect do |order_entry|
            price = NumericHelper.to_d(order_entry[0])
            amount = NumericHelper.to_d(order_entry[1])
            Cryptoexchange::Models::Order.new(price: price,
                                              amount: amount)
          end
        end
      end
    end
  end
end
