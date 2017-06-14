# frozen_string_literal: true

class Person < ApplicationRecord # :nodoc:
  has_and_belongs_to_many :circles
  belongs_to :organization, optional: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {
    normal: 0,
    admin:  1
  }
end
