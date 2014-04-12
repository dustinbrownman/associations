require 'spec_helper'

describe User do
  it { should have_many :photos }
  it { should have_many :favorites }

  it "should have many favorited photos through favorites" do
    user = FactoryGirl.create(:user)
    photo = FactoryGirl.create(:photo)
    FactoryGirl.create(:favorite, user: user, photo: photo)
    expect(user.favorited_photos.first).to eq photo
  end

  it "should have an association with users who have favorited the same photos" do
    user_a = FactoryGirl.create(:user)
    user_b = FactoryGirl.create(:user, name: 'bobby')
    photo = FactoryGirl.create(:photo)
    FactoryGirl.create(:favorite, user: user_a, photo: photo)
    FactoryGirl.create(:favorite, user: user_b, photo: photo)
    expect(user_a.fellow_favoritors).to eq [user_b]
  end

  it "should only return unique users" do
    user_a = FactoryGirl.create(:user)
    user_b = FactoryGirl.create(:user, name: 'bobby')
    photo_a = FactoryGirl.create(:photo)
    photo_b = FactoryGirl.create(:photo, name: 'goldfish')
    FactoryGirl.create(:favorite, user: user_a, photo: photo_a)
    FactoryGirl.create(:favorite, user: user_b, photo: photo_a)
    FactoryGirl.create(:favorite, user: user_a, photo: photo_b)
    FactoryGirl.create(:favorite, user: user_b, photo: photo_b)
    expect(user_a.fellow_favoritors).to eq [user_b]
  end
end
