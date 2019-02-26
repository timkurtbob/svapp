class Attachment < ApplicationRecord
  belongs_to :user
  belongs_to :entry
  mount_uploader :name, PhotoUploader
end
