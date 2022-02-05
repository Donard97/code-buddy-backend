class CreateMeetingTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :meeting_types do |t|
      t.string :name
      t.string :color
      t.string :image
      t.string :icon

      t.timestamps
    end
  end
end
