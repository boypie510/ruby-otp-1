class AuthenticationService
  attr_reader :profile, :token, :notification

  def initialize(profile = nil, token = nil, notification)
    @profile = profile || ProfileDao.new
    @token = token || RsaTokenDao.new
    @notification = notification
  end

  def valid?(account, password)
    password_for_dao = profile.password(account)
    random_code = token.random_token(account)

    valid_password = password_for_dao + random_code
    is_valid = valid_password == password

    if is_valid
      true
    else
      notification.notify("account:#{account} try to login failed")
      false
    end
  end
end
