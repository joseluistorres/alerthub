def set_omniauth(opts = {})
  default = {:provider => :google_oauth2,
            :uid => "123456789",
            :info => {
              :name => "John Doe",
              :email => "joseluis@something.com",
              :first_name => "foo",
              :last_name => "bar",
            }
        }

  credentials = default.merge(opts)
  
  provider = credentials[:provider]
debugger
  user_hash = credentials[:info]

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[provider] = {
    'provider' => credentials[:provider],
    'uid' => credentials[:uuid],
    "info" => {
      "name" => user_hash[:name],
      "email" => user_hash[:email],
      "first_name" => user_hash[:first_name],
      "last_name" => user_hash[:last_name],
      }
    
  }
end
