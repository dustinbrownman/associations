class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :favoritors, through: :favorites, source: :user
end
