class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entries, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bees, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :attachments
  belongs_to :school

  enum role: { super_admin: 0, admin: 1, mitglied: 2, beobachter: 3 }

end
