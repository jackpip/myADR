class CreateCues < ActiveRecord::Migration[5.0]
  def change
    create_table :cues do |t|
      t.string :start_time
      t.string :end_time
      t.text :notes
      t.text :private_notes
      t.string :called_by
      t.boolean :omit
      t.integer :character_id
      t.integer :episode_id

      t.timestamps
    end
  end
end
