require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "new user (signup) page" do
    before { visit signup_path }

    let(:submit) { "Create Account" }

    it { should have_css('h1', text: 'Sign up') }
    it { should have_title(full_title('Sign up')) }

    describe "register with invalid information" do
      it "does not create a new user" do
        expect{ click_button submit }.to_not change(User, :count)
      end

      # Unsuccessful Post-save Behavior
      describe "after submission" do
        before { click_button submit }
        it { should have_title(full_title('Sign up')) }
        it { should have_css('h1', text: 'Sign up') }
        it { should have_css('div#error_explanation') }
        it { should have_content('error') }
        it { should have_css('div.alert.alert-error') }
        it { should have_css('div.field_with_errors') }
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

      # Successful Post-save Behavior
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'j.olberding@example.com') }

        it { should have_title(full_title(user.name)) }
        it { should have_css('div.alert.alert-success', text: 'Welcome') }
      end

    end

  end

  describe "show user (profile) page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_css('h1', text: user.name) }
    it { should have_title(user.name) }
    # valid keys, should be one of :text, :visible, :between, :count, :maximum, :minimum, :exact, :match, :wait
    it { should have_css('img', text: "http://tbd") }
  end

end
