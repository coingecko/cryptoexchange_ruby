require 'spec_helper'

RSpec.describe Cryptoexchange::Exchanges::Zooomex::Market do
  it { expect(described_class::NAME).to eq 'zooomex' }
  it { expect(described_class::API_URL).to eq 'https://www.zooomex.com/api/v2/trade' }
end
