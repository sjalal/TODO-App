class List < ActiveRecord::Base
  attr_accessible :description, :name
  validates :description, :presence => true
  has_many :tasks
end
