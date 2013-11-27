require "spec_helper"

feature 'View the homepage' do
	scenario 'user sees homepage' do
		visit root_path
		page.should have_content "Welcome" 
	end
end
