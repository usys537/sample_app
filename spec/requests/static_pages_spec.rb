require 'spec_helper'

describe "StaticPages" do

	subject { page }

  describe "Home pages" do

    it "should have the content Sample App" do
    	visit '/static_pages/Home'
    	page.should have_content('Sample App')
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
    
  end

end
