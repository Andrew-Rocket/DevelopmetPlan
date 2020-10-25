class AddReferenceToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :flow_step, foreign_key: true, null: false
  end
end
