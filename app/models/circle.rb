# frozen_string_literal: true

class Circle < ApplicationRecord # :nodoc:
  has_and_belongs_to_many :members, class_name: 'Person', join_table: 'circles_people'
  belongs_to :parent,   class_name: 'Circle', foreign_key: 'circle_id', optional: true
  has_many   :children, class_name: 'Circle', foreign_key: 'circle_id'

  def parent_name
    parent.nil? ? '' : parent.name
  end
end
