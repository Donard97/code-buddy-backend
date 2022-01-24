class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.string :full_name
      t.string :avatar
      t.date :birthday
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
