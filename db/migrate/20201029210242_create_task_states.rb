# frozen_string_literal: true

class CreateTaskStates < ActiveRecord::Migration[6.0]
  def change
    create_table :task_states do |t|
      t.integer :state, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.timestamps
    end
  end
end
