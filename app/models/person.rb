class Person < ApplicationRecord
  has_and_belongs_to_many :circles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
