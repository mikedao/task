class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.string :desc
      t.boolean :active
      t.datetime :due_date
      t.integer :list_id

      t.timestamps null: false
    end
  end
end
