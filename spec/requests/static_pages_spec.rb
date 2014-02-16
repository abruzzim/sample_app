require 'spec_helper'

describe "StaticPages" do
  let(:base_title) { "Sample App" }
  describe "Home page" do
    it "has the <title> Sample App | Home" do
      visit '/static_pages/home'
      expect(page).to have_title("#{base_title} | Home")
    end
    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App Home')
    end
  end
  describe "Help page" do
    it "has the <title> Sample App | Help" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
    it "has the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end
  describe "About page" do
    it "has the <title> Sample App | About Us" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About Us")
    end
    it "has the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
  describe "Contact page" do
    it "has the <title> Sample App | Contact" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | Contact")
    end
    it "has the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
  end
end
