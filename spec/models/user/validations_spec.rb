require "spec_helper"

describe User, "validations" do
  it { should allow("John").for(:name) }
  it { should_not allow(nil).for(:name) }

  it { should allow("john@example.org").for(:email) }
  it { should_not allow("invalid", nil).for(:email) }

  it { should allow("test").for(:password) }
  it { should_not allow(nil).for(:password) }

  context "e-mail uniqueness" do
    let!(:user) {
      User.create!({
        :name => "John Doe",
        :email => "john@example.org",
        :password => "test",
        :password_confirmation => "test"
      })
    }

    it { should_not allow(user.email).for(:email) }
  end
end
