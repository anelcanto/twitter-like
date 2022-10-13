class AddMoodToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :mood, :string
  end
end
