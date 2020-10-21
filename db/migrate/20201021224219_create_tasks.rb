class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :level
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
