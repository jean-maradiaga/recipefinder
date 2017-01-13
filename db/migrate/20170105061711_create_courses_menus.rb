class CreateCoursesMenus < ActiveRecord::Migration
  def change
    create_table :courses_menus do |t|
      t.string :course_name
      t.string :day
      t.references :menu, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
