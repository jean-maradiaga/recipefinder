class Recipe < ActiveRecord::Base
  
  include HTTParty

  belongs_to :cook_book
  has_and_belongs_to_many :courses_menus, dependent: :destroy


  key_value = ENV['FOOD2FORK_KEY']
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"

  default_params key: key_value, page: 1
  format :json

  def self.for (keyword, page_num)
    default_params page: page_num
    get("/search", query: {q: keyword})["recipes"]
  end

end
