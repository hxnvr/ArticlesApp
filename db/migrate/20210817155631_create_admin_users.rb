# frozen_string_literal: true

class CreateAdminUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :admin_users, :email, unique: true
  end
end
