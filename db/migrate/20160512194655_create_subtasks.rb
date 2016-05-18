class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.references :task, index: true, foreign_key: true
      t.text :title, null:false
      t.boolean :importance
      t.boolean :urgency
      t.time :due_time
      t.boolean :status
      t.datetime :completed_at

      t.timestamps null: false
    end
  end
end
