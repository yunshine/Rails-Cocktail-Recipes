class CreateCocktails < ActiveRecord::Migration[6.0]
  def change
    create_table :cocktails do |t|
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
