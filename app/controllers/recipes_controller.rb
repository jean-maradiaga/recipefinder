class RecipesController < ApplicationController
    before_action :set_filter
    skip_before_action :ensure_login, only: [:index]

		def index
		  @page = params[:page] || 1
		  @search_term = params[:search] || 'chocolate'
		  @recipes = Recipe.for(@search_term, @page)
		end

	private
		    # Use callbacks to share common setup or constraints between actions.
		def set_filter
		 @filter_options = ["Chicken", "Fish", "Pork", "Beef", "Vegetarian", "Bread", "Fruit", "Dessert"] 
		end
end
