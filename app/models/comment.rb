class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  has_many :bees
end
