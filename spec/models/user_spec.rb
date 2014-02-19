require 'spec_helper'

describe User do

  before { @user = User.new(name: "First Last", email: "first.last@test.com") }

  subject { @user }

  # User method response testing.
  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when Name is null" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "when Name is blank" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "when Name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when Email is null" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "when Email is blank" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "when Email format is invalid" do
    it "should be invalid" do
      addresses = %w(
        user@domain,com
        user_at_corp.org
        first.last@company.
        user@small_biz.com
        user@small+biz.com
        user@example..com
      )
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).to_not be_valid
      end
    end
  end

  describe "when Email format is valid" do
    it "should be valid" do
      addresses = %w(
        user@domain.COM
        USER_at-corp@something.org
        first.last@x.y.z.org
        fname.lname@biz.com
        fname+lname@biz.cn
      )
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

  describe "when an email address is already taken" do
    before do
      user2       = @user.dup
      user2.email = @user.email.upcase
      user2.save
    end
    it { should_not be_valid }
  end

end
