class CreateCoursesMenusRecipes < ActiveRecord::Migration
  def change
    create_table :courses_menus_recipes, id: false do |t|
      t.references :courses_menu, index: true, foreign_key: true
      t.references :recipe, index: true, foreign_key: true
    end
  end
end
