json.extract! courses_menu, :id, :course_name, :day, :menu_id, :created_at, :updated_at
json.url courses_menu_url(courses_menu, format: :json)