class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :actor
      t.integer :cue_id
      t.integer :episode_id
      t.integer :show_id

      t.timestamps
    end
  end
end
