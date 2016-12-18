class AddTokenToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :token, :string, index: true
  end
end
