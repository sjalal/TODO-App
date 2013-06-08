class Task < ActiveRecord::Base
  attr_accessible :complete, :description
  # validates :task, presence: true
end
