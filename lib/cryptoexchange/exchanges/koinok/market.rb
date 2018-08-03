module Cryptoexchange::Exchanges
  module Koinok
    class Market < Cryptoexchange::Models::Market
      NAME = 'koinok'
      API_URL = 'https://www.koinok.com/api/brain'
    end
  end
end
