class Movies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.string :genres
      t.string :writters
      t.string :director
      t.string :summary
      t.string :actors
      t.integer :release_year
      t.timestamps
    end
  end
end
