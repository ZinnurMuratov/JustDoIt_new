class AddColumnDateToSubtasks < ActiveRecord::Migration
  def self.up

    add_column :subtasks, :due_time, :datetime
  end
end
