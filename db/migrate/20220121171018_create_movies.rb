class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :integer
      t.integer :duration
      t.text :description
      t.decimal :average_vote
      t.references :production_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
