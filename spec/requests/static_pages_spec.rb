require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before(:each) { visit root_path }

    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
    it { should have_content('Sample App') }

  end

  describe "Help page" do
    before(:each) { visit help_path }

    it { should have_title(full_title('Help')) }
    it { should have_content('Help') }

  end

  describe "About page" do
    before { visit about_path }

    it { should have_title(full_title('About')) }
    it { should have_content('About') }

  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_title(full_title('Contact')) }
    it { should have_content('contact') }

  end

end
