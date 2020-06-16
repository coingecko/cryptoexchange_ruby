module Cryptoexchange::Exchanges
  module Ercdex
    module Services
      class OrderBook < Cryptoexchange::Services::Market
        class << self
          def supports_individual_ticker_query?
            true
          end
        end

        def fetch(market_pair)
          pair_id = IdFetcher.get_id(market_pair.base.upcase, market_pair.target.upcase)
          base = pair_id[0]["tokenPair"]["tokenA"]["address"]
          target = pair_id[0]["tokenPair"]["tokenB"]["address"]
          output = super(ticker_url(base, target))
          adapt(output, market_pair)
        end

        def ticker_url(base, target)
          "#{Cryptoexchange::Exchanges::Ercdex::Market::API_URL}/aggregated_orders?networkId=1&baseTokenAddress=#{base}&quoteTokenAddress=#{target}"
        end

        def adapt(output, market_pair)
          order_book = Cryptoexchange::Models::OrderBook.new
          order_book.base = market_pair.base
          order_book.target = market_pair.target
          order_book.market = Ercdex::Market::NAME
          order_book.asks = adapt_orders(output['buys']['priceLevels'])
          order_book.bids = adapt_orders(output['sells']['priceLevels'])
          order_book.timestamp = Time.now.to_i
          order_book.payload = output
          order_book
        end

        def adapt_orders(orders)
          orders.collect do |order_entry|
            Cryptoexchange::Models::Order.new(price: order_entry['price'],
                                              amount: order_entry['volume'],
                                              timestamp: Time.now.to_i)
          end
        end
      end
    end
  end
end
