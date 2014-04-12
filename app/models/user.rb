class User < ActiveRecord::Base
  has_many :photos
  has_many :favorites
  has_many :favorited_photos, through: :favorites, source: :photo
  has_many :fellow_favoritors, ->(user) { where.not(id: user).distinct }, through: :favorited_photos, source: :favoritors
end
