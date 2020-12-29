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
        profile = FakeProfile.new
        token = FakeToken.new
        authentication = AuthenticationService.new(profile, token)
        is_valid = authentication.valid?('joey', '91000000')
        expect(is_valid).to be(true)
      end
    end
  end

end

class FakeProfile < ProfileDao
  def password(account)
    if account == 'joey'
      return '91'
    end
    raise NotImplementedError
  end
end

class FakeToken < RsaTokenDao
  def random_token(account)
    '0' * 6
  end
end