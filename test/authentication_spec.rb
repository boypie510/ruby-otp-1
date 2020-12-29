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
        authentication = AuthenticationService.new
        is_valid = authentication.valid?('joey', '91000000')
        expect(is_valid).to be(true)
      end
    end
  end

end