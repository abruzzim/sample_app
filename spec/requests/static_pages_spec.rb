require 'spec_helper'

describe "StaticPages" do
  describe "Home page" do
    it "has the <title> Home" do
      visit '/static_pages/home'
      expect(page).to have_title("Home")
    end
    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App Home')
    end
  end
  describe "Help page" do
    it "has the <title> Help" do
      visit '/static_pages/help'
      expect(page).to have_title("Help")
    end
    it "has the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
  describe "About page" do
    it "has the <title> About Us" do
      visit '/static_pages/about'
      expect(page).to have_title("About Us")
    end
    it "has the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
end
