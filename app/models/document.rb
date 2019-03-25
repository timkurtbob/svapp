class Document < ApplicationRecord
  belongs_to :school
  mount_uploader :name, FileUploader
end
