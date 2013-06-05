class AddDescriptionAndCompleteToTasks < ActiveRecord::Migration
  def change
     add_column :tasks, :description, :text 
     add_column :tasks, :complete, :boolean, :default => false 
  end
end
