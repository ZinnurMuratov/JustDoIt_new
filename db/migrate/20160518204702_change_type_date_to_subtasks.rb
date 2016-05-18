class ChangeTypeDateToSubtasks < ActiveRecord::Migration
  def self.up

    remove_column :subtasks, :due_time
  end
  def self.down
    add_column :subtasks, :due_time, :datetime
  end
end
