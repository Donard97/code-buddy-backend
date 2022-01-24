class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :description
      t.string :color
      t.string :image
      t.string :link
      t.string :attendee_limit
      t.references :user, null: false, foreign_key: true
      t.references :meeting_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
