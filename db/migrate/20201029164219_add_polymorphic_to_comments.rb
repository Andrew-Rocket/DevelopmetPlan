# frozen_string_literal: true

class AddPolymorphicToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :commentable, polymorphic: true
  end
end
