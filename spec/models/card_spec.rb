require 'rails_helper'

describe Card do
  it { should belong_to :user }
  it { should belong_to :deck }
  it { should validate_presence_of :title }
  it { should validate_presence_of :user }
  it { should validate_presence_of :deck }
end
