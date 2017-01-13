# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Menu.destroy_all
CookBook.destroy_all
CoursesMenu.destroy_all
Recipe.destroy_all



User.create! [
  { email: "jean@mail.com", password: "12345", status: true },
  { email: "wendy@mail.com", password: "12345", status: true  },
  { email: "jose@mail.com", password: "12345", status: true  },
  { email: "vivi@mail.com", password: "12345", status: true  },
  { email: "emilio@mail.com", password: "12345", status: true  }
]

sample_menus = Menu.create! [
  { name: "For Mom", description: "Menu to lose weight" },
  { name: "For Dad", description: "Menu to gain more muscle" },
  { name: "For the lil tykes", description: "Menu so they stop being fat" },
  { name: "For the Vegan Aunt", description: "For the old harpy" }
]

sample_cookbooks = CookBook.create! [
  { name: "Jean'selections", description: "Premiun choices by Jean" },
  { name: "Wendy'selections", description: "Premiun choices by Wendy" },
  { name: "Jose'selections", description: "Premiun choices by Jose" },
  { name: "Best of All", description: "JPremiun choices by the Crew" }
]

sample_recipes = Recipe.create! [
  { img_url: "http://static.food2fork.com/BrownieFeature193f.jpg", title: "Slutty Brownies", source_url: "http://whatsgabycooking.com/slutty-brownies/"},
  { img_url: "http://static.food2fork.com/pizza292x2007a259a79.jpg", title: "Homemade Pizza", source_url: "http://www.simplyrecipes.com/recipes/homemade_pizza/" },
  { img_url: "http://static.food2fork.com/5337400468_d5892f3a03_od5cd.jpg", title: "Chicken Tortilla Soup", source_url: "http://thepioneerwoman.com/cooking/2011/01/chicken-tortilla-soup/"},
  { img_url: "http://static.food2fork.com/GuacamoleGrilledCheese6019.jpg", title: "Guacamole Grilled Cheese Sandwich", source_url: "http://www.twopeasandtheirpod.com/guacamole-grilled-cheese-sandwich/"}
]


sample_cm = CoursesMenu.create! [

  { course_name: "Breakfast", day: "Monday" },
  { course_name: "Day Snack", day: "Monday" },
  { course_name: "Lunch", day: "Monday" },
  { course_name: "Dinner", day: "Monday" },
  { course_name: "Night Snack", day: "Monday" },

  { course_name: "Breakfast", day: "Tuesday" },
  { course_name: "Day Snack", day: "Tuesday" },
  { course_name: "Lunch", day: "Tuesday" },
  { course_name: "Dinner", day: "Tuesday" },
  { course_name: "Night Snack", day: "Tuesday" },

  { course_name: "Breakfast", day: "Wednesday" },
  { course_name: "Day Snack", day: "Wednesday" },
  { course_name: "Lunch", day: "Wednesday" },
  { course_name: "Dinner", day: "Wednesday" },
  { course_name: "Night Snack", day: "Wednesday" },

  { course_name: "Breakfast", day: "Thursday" },
  { course_name: "Day Snack", day: "Thursday" },
  { course_name: "Lunch", day: "Thursday" },
  { course_name: "Dinner", day: "Thursday" },
  { course_name: "Night Snack", day: "Thursday" },

  { course_name: "Breakfast", day: "Friday " },
  { course_name: "Day Snack", day: "Friday " },
  { course_name: "Lunch", day: "Friday " },
  { course_name: "Dinner", day: "Friday " },
  { course_name: "Night Snack", day: "Friday " },

  { course_name: "Breakfast", day: "Saturday" },
  { course_name: "Day Snack", day: "Saturday" },
  { course_name: "Lunch", day: "Saturday" },
  { course_name: "Dinner", day: "Saturday" },
  { course_name: "Night Snack", day: "Saturday" },

  { course_name: "Breakfast", day: "Sunday" },
  { course_name: "Day Snack", day: "Sunday" },
  { course_name: "Lunch", day: "Sunday" },
  { course_name: "Dinner", day: "Sunday" },
  { course_name: "Night Snack", day: "Sunday" }
]


CoursesMenu.all.each do |c|
  c.recipes << sample_recipes.sample
  c.save!
end

CookBook.all.each do |b|
  b.recipes << sample_recipes.sample
  b.save!
end

Menu.all.each do |m|
  m.courses_menus << sample_cm.sample
  m.save!
end

User.all.each do |u|
  u.menus << sample_menus.sample
  u.cook_books << sample_cookbooks.sample
  u.save!
end
