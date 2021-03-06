# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.integer :level

      t.timestamps
    end
  end
end
