require 'spec_helper'

RSpec.describe Cryptoexchange::Exchanges::Excoincial::Market do
  it { expect(described_class::NAME).to eq 'excoincial' }
  it { expect(described_class::API_URL).to eq 'https://excoincial.com/api/v2' }
end
