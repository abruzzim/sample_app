require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "new user (signup) page" do
    before { visit signup_path }

    let(:submit) { "Create Account" }

    it { should have_css('h1', text: 'Sign up') }
    it { should have_title(full_title('Sign up'))}

    describe "register with invalid information" do
      it "does not create a new user" do
        expect{ click_button submit }.to_not change(User, :count)
      end
    end

    describe "register with valid information" do
      before do
        fill_in "Name",         with: "John Olberding"
        fill_in "Email",        with: "j.olberding@example.com"
        fill_in "Password",     with: "Secret"
        fill_in "Confirmation", with: "Secret"
      end
      it "creates a new user" do
        expect{ click_button submit }.to change(User, :count).by(1)
      end
    end

  end

  describe "show user (profile) page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_css('h1', text: user.name) }
    it { should have_title(user.name) }
  end

end
