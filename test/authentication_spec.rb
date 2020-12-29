require 'rspec'
require_relative '../lib/loads'

describe 'Authentication' do
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end
  describe ":is_valid" do
    context "when valid" do
      it 'should be return true' do
        profile = double
        allow(profile).to receive(:password).with('joey').and_return('91')

        token = double
        allow(token).to receive(:random_token).and_return('0' * 6)

        authentication = AuthenticationService.new(profile, token)
        is_valid = authentication.valid?('joey', '91000000')
        expect(is_valid).to be(true)
      end
    end
  end

end

