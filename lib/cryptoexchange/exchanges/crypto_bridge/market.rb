module Cryptoexchange::Exchanges
  module CryptoBridge
    class Market < Cryptoexchange::Models::Market
      NAME = 'crypto_bridge'
      API_URL = 'https://api.crypto-bridge.org/api/v1'
    end
  end
end
