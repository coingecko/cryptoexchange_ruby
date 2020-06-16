module Cryptoexchange::Exchanges
  module Amoveo
    class Market < Cryptoexchange::Models::Market
      NAME = 'amoveo'
      API_URL = 'https://amoveo.exchange/api/v1'
    end
  end
end
