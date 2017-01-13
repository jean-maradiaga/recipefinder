class AddColumnsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :img_url, :string
    add_column :recipes, :title, :string
    add_column :recipes, :source_url, :string
    add_reference :recipes, :cook_book, index: true, foreign_key: true
  end
end
