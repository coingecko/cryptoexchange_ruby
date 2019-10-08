module Cryptoexchange::Exchanges
  module Bitexlive
    module Services
      class OrderBook < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
          output = JSON.parse(HTTP.get(ticker_url(market_pair)).to_s.split("</div>")[1])
          adapt(output, market_pair)
        end

        def ticker_url(market_pair)
          "#{Cryptoexchange::Exchanges::Bitexlive::Market::API_URL}/orderBook?filter=#{market_pair.base.upcase}_#{market_pair.target.upcase}"
        end

        def adapt(output, market_pair)
          order_book = Cryptoexchange::Models::OrderBook.new
          order_book.base      = market_pair.base
          order_book.target    = market_pair.target
          order_book.market    = Bitexlive::Market::NAME
          order_book.asks      = adapt_orders output['asks']
          order_book.bids      = adapt_orders output['bids']
          order_book.payload   = output
          order_book
        end

        def adapt_orders(orders)
          orders.collect do |order_entry|
            Cryptoexchange::Models::Order.new(
              price:     order_entry[0].to_f,
              amount:    order_entry[1].to_f,
              timestamp: nil
            )
          end
        end
      end
    end
  end
end
