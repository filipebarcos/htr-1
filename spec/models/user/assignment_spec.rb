require "spec_helper"

describe User, "assignment" do
  # subject {
  #   User.new({
  #     :name => "John Doe",
  #     :email => "john@example.org",
  #     :password => "test",
  #     :password_confirmation => "test"
  #   })
  # }
  #
  # its(:name) { should eql("John Doe") }
  # its(:email) { should eql("john@example.org") }
  # its(:password) { should eql("test") }
  # its(:password_confirmation) { should eql("test") }

  it "doesn't throw exception" do
    expect {
      User.create!({
        :name => "John Doe",
        :email => "john@example.org",
        :password => "test",
        :password_confirmation => "test"
      })
    }.to_not raise_error
  end
end
