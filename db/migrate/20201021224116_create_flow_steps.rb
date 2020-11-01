# frozen_string_literal: true

class CreateFlowSteps < ActiveRecord::Migration[6.0]
  def change
    create_table :flow_steps do |t|
      t.string :title
      t.references :plan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
