class AboutController < ApplicationController

  before_action :set_random
  skip_before_action :ensure_login, only: [:manifesto]

  # You can leave the about method blank, it will render
  # the corresponding .html.erb by default

  def manifesto
  end

  	private
		    # Use callbacks to share common setup or constraints between actions.
		def set_random
		 @random_options = ["Chicken", "Fish", "Pork", "Beef", "Vegetarian", "Bread", "Fruit", "Dessert", "Japanese",
		                    "Chocolate", "Vegan", "Noodles", "Caramel", "Bacon", "Nutella", "Pie", "Vanilla", "Indian",
                        "Cookie", "Apple", "Strawberry", "Peas", "Banana", "Mexican"] 

     @ing = @random_options.sample(3)
                        
     @recipe1  = Recipe.for(@ing[1], 1).sample
     @recipe2  = Recipe.for(@ing[2], 1).sample
     @recipe3  = Recipe.for(@ing[3], 1).sample

		end

end