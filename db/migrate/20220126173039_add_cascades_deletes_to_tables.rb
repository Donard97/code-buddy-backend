class AddCascadesDeletesToTables < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :user_details, :users
    add_foreign_key :user_details, :users, on_delete: :cascade
    remove_foreign_key :meetings, :users
    add_foreign_key :meetings, :users, on_delete: :cascade
    remove_foreign_key :meetings, :meeting_types
    add_foreign_key :meetings, :meeting_types, on_delete: :cascade
    remove_foreign_key :reservations, :users
    add_foreign_key :reservations, :users, on_delete: :cascade
    remove_foreign_key :reservations, :meetings
    add_foreign_key :reservations, :meetings, on_delete: :cascade
  end
end
