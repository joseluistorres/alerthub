require 'spec_helper'

feature 'Sign in via Google' do

	background do
     default = {:provider => :google_oauth2,
            :uid => "123456789",
            :info => {
              :name => "John Doe",
              :email => "joseluis@something.com",
              :first_name => "foo",
              :last_name => "bar",
            }
        }

    set_omniauth default
		visit root_path
		click_link 'Sign in with Google'
	end

  before(:each) do
    OmniAuth.config.test_mode = true
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  end

	scenario 'click login via Google' do
		page.should have_content('Successfully authenticated from Google')
		page.should have_content('johndoe@example.com')
		current_path.should == dashboard_path

		user = User.find_by_email('johndoe@example.com')
		user.should_not be_nil
	end

end
