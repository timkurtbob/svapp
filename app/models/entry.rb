class Entry < ApplicationRecord
  belongs_to :user
  has_many :attachments
  has_many :comments
  has_many :bookmarks
end
