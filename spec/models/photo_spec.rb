require 'spec_helper'

describe Photo do
  it { should belong_to :user }
  it { should have_many :favorites }
  it { should have_many(:favoritors).through(:favorites) }
end
