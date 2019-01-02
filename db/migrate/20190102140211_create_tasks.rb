class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :first_planned
      t.integer :second_planned
      t.string :status

      t.timestamps
    end
  end
end
