class User
  include ActiveModel::Validations
  attr_accessor :email
  validates :email, email: true
end

RSpec.describe EmailValidator do
  describe "version" do
    it "is present" do
      expect(EmailValidator::VERSION).not_to be nil
    end
  end

  describe "email validation" do
    let(:user) { User.new }
    it { user.email = "asdf"; user.valid?; expect(user.errors[:email]).to include("is not a valid email address") }
    it { user.email = "asdf@asdf"; user.valid?; expect(user.errors[:email]).to include("is not a valid email address") }
    it { user.email = "asdf@asdf.com"; user.valid?; expect(user.errors[:email]).to_not include("is not a valid email address") }
  end
end
