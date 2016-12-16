class CreateShows < ActiveRecord::Migration[5.0]
  def change
    create_table :shows do |t|
      t.string :name
      t.integer :episode_id
      t.integer :character_id
      t.integer :user_id

      t.timestamps
    end
  end
end
