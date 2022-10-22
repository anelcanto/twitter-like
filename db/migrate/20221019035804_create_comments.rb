class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :tittle
      t.text :content
      t.string :mood
      t.string :string
      t.integer :
      t.references :parent, foreign_key: { to_table: :posts }

      t.timestamps
    end
  end
end
