class RecipesController < ApplicationController
    before_action :set_filter

		def index
		  @search_term = params[:search] || 'chocolate'
		  @recipes = Recipe.for(@search_term)
		end

	private
		    # Use callbacks to share common setup or constraints between actions.
		def set_filter
		 @filter_options = ["Chicken", "Fish", "Pork", "Beef", "Vegetarian", "Bread", "Fruit", "Dessert"] 
		end
end
