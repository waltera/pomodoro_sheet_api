class CreatePomodoros < ActiveRecord::Migration[5.1]
  def change
    create_table :pomodoros do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :canceled_at
      t.integer :status, default: 0
      t.boolean :first_try, default: :true

      t.belongs_to :task, index: true, null: false

      t.timestamps
    end
  end
end
