require 'spec_helper'

RSpec.describe Cryptoexchange::Exchanges::Amoveo::Market do
  it { expect(described_class::NAME).to eq 'amoveo' }
  it { expect(described_class::API_URL).to eq 'https://amoveo.exchange/api/v1' }
end
