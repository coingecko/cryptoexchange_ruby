require 'spec_helper'

RSpec.describe Cryptoexchange::Exchanges::Xs2::Market do
  it { expect(described_class::NAME).to eq 'xs2' }
  it { expect(described_class::API_URL).to eq 'https://xs2.exchange/API/V1' }
end
