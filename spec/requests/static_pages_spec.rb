require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do

    it { should have_title(full_title(page_title)) }

    it { should have_css('h1', text: heading) }

    it "has the correct header layout links" do
      click_link "Home"
      expect(page).to have_css('h1', text: 'Sample App')
      click_link "Help"
      expect(page).to have_css('h1', text: 'Help')
      click_link "Sign In"
      expect(page).to have_css('h1', text: 'Sign In')
    end

    it "has the correct footer layout links" do
      click_link "About"
      expect(page).to have_css('h1', text: 'About')
      click_link "Contact"
      expect(page).to have_css('h1', text: 'Contact')
    end

  end

  describe "Home page" do

    before(:each) { visit root_path }

    let(:page_title) { '' }
    let(:heading)    { 'Sample App' }

    it_should_behave_like "all static pages"

    it { should_not have_title('| Home') }

    it "has a link to Register" do
      click_link "Register"
      expect(page).to have_css('h1', text: 'Sign up')
    end

  end

  describe "Help page" do

    before(:each) { visit help_path }

    let(:page_title) { 'Help' }
    let(:heading)    { 'Help' }

    it_should_behave_like "all static pages"

  end

  describe "About page" do

    before { visit about_path }

    let(:page_title) { 'About' }
    let(:heading)    { 'About' }

    it_should_behave_like "all static pages"

  end

  describe "Contact page" do

    before { visit contact_path }

    let(:page_title) { 'Contact' }
    let(:heading)    { 'Contact' }
    
    it_should_behave_like "all static pages"

  end

end
