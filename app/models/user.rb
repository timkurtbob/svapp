class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :entries
  has_many :comments
  has_many :bees
  has_many :bookmarks
  belongs_to :school

  enum role: { super_admin: 0, admin: 1, mitglied: 2, beobachter: 3 }

end
