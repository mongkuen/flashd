require 'rails_helper'

describe User do
  it { should have_secure_password }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should allow_value("test@test.com", "test+test@test.com").for(:email) }
  it { should_not allow_value("a", "asd@", "asd@asd").for(:email) }
  it { should validate_presence_of :password }
  it { should validate_length_of(:password).is_at_least(7) }
  it { should have_many :decks }
end
