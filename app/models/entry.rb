class Entry < ApplicationRecord
  belongs_to :user
  has_many :attachments, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
end
