require 'spec_helper'

describe User do

  before do 
    @user = User.new(
      name:                  "First Last", 
      email:                 "first.last@test.com",
      password:              "secret",
      password_confirmation: "secret"
    ) 
  end

  subject { @user }

  # User method response testing.
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "; when Name is null" do
    before { @user.name = "" }
    it { should_not be_valid }
  end

  describe "; when Name is blank" do
    before { @user.name = " " }
    it { should_not be_valid }
  end

  describe "; when Name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "; when Email is null" do
    before { @user.email = "" }
    it { should_not be_valid }
  end

  describe "; when Email is blank" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "; when Email format is invalid" do
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

  describe "; when Email format is valid" do
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

  describe "; when an email address is already taken" do
    before do
      user2       = @user.dup
      user2.email = @user.email.upcase
      user2.save
    end
    it { should_not be_valid }
  end

  # Test the "before_save" callback.
  describe "; email address with mixed case" do
    let(:mixed_case_email) { "uSeR@SaMpLe.CoM" }
    it "saves the email address in all lowercase" do
      @user.email = mixed_case_email
      @user.save
      expect(@user.reload.email).to eq mixed_case_email.downcase
    end
  end

  describe "; when Password is blank" do
    before do
      @user.password              = " "
      @user.password_confirmation = " "
    end
    it { should_not be_valid }
  end

  describe "; when Password does not match its Confirmation" do
    before do
      @user.password              = "secret"
      @user.password_confirmation = "secrett"
    end
    it { should_not be_valid }
  end

  describe "; #authenticate return value" do
    # Save the user to the database.
    before { @user.save }
    # Invoke "let" to retrieve the saved user by email address.
    let(:found_user) { User.find_by(email: @user.email) }
    # Compare "@user" and "found_user" using the object equality test.
    describe "; with a valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end
    # Compare "@user" and "user_with_invalid_password" using the object equality test.
    describe "; with an invalid password" do
      # Invoke "let" to authenticate an invalid password.
      let(:user_with_invalid_password) { found_user.authenticate("bogus") }
      it { should_not eq user_with_invalid_password }
      # "specify" is an a synonym for "it".
      specify { expect(user_with_invalid_password).to be_false }
    end
  end

  describe "; with a password that is too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

end
