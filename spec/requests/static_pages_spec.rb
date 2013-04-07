require 'spec_helper'

describe "StaticPages" do

  describe "Home pages" do

    it "should have the content Sample App" do
    	visit '/static_pages/Home'
    	page.should have_content('Sample App')
    end
  end
end
