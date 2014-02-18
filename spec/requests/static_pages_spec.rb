require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Sample App" }

  describe "Home page" do

    it "has the <title> Sample App" do
      visit root_path
      expect(page).to have_title("#{base_title}")
    end
    it "does not have the custom <title> | Home" do
      visit root_path
      expect(page).to_not have_title("#{base_title} | Home")
    end
    it "has the content 'Sample App'" do
      visit root_path
      expect(page).to have_content('Sample App')
    end

  end

  describe "Help page" do

    it "has the <title> Sample App" do
      visit help_path
      expect(page).to have_title("#{base_title}")
    end
    it "has the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

  end

  describe "About page" do

    it "has the <title> Sample App" do
      visit about_path
      expect(page).to have_title("#{base_title}")
    end
    it "has the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About Us')
    end

  end

  describe "Contact page" do

    it "has the <title> Sample App" do
      visit contact_path
      expect(page).to have_title("#{base_title}")
    end
    it "has the content 'Contact'" do
      visit contact_path
      expect(page).to have_content('Contact')
    end

  end

end
