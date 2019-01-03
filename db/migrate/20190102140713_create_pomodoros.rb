class CreatePomodoros < ActiveRecord::Migration[5.1]
  def change
    create_table :pomodoros do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :status, default: 0

      t.belongs_to :task, index: true, null: false
    end
  end
end
