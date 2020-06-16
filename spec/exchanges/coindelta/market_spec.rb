require 'spec_helper'

RSpec.describe Cryptoexchange::Exchanges::Coindelta::Market do
  it { expect(described_class::NAME).to eq 'coindelta' }
  it { expect(described_class::API_URL).to eq 'https://api.coindelta.com/api/v2/public' }
end
