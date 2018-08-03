module Cryptoexchange::Exchanges
  module Lbank
    class Market < Cryptoexchange::Models::Market
      NAME = 'lbank'
      API_URL = 'https://api.lbank.info/v1'
    end
  end
end
