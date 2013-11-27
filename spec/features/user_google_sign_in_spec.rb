require 'spec_helper'

feature 'Sign in via Google' do

	background do
		visit root_path
		click_link 'Sign in'
	end

	scenario 'click login via Google' do
		page.should have_content('Successfully authenticated from Google')
		page.should have_content('johndoe@example.com')
		current_path.should == dashboard_path

		user = User.find_by_email('johndoe@example.com')
		user.should_not be_nil
	end

end
