# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :title
      t.references :department, null: false, foreign_key: true

      t.timestamps
    end
  end
end
