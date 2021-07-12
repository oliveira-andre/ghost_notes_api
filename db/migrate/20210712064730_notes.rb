# frozen_string_literal: true

class Notes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes, id: :uuid do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.string :keys, array: true, null: false, default: []
      t.string :encrypted_password
      t.string :slug, null: false, unique: true

      t.timestamps
    end
  end
end
