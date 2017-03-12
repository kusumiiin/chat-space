class AddForeignKeyToMessages < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :messages, :users
    add_foreign_key :messages, :groups
  end
end
