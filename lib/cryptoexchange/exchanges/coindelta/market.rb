module Cryptoexchange::Exchanges
    module Coindelta
      class Market < Cryptoexchange::Models::Market
        NAME = 'coindelta'
        API_URL = 'https://api.coindelta.com/api/v2/public'
      end
    end
  end
