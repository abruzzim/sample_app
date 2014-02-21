require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "new user (signup) page" do
    before { visit signup_path }

    it { should have_css('h1', text: 'Sign up') }
    it { should have_title(full_title('Sign up'))}
  end

  describe "show user (profile) page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_css('h1', text: user.name) }
    it { should have_title(user.name) }
  end

end
