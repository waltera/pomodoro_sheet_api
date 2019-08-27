class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :description
      t.integer :status, default: 0

      t.belongs_to :user, index: true, null: false

      t.timestamps
    end
  end
end
