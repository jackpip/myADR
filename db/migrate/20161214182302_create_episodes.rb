class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.integer :episode_number
      t.integer :show_id
      t.integer :character_id
      t.integer :cue_id

      t.timestamps
    end
  end
end
