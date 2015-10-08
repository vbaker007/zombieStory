class Story < ActiveRecord::Base
  has_many :chapters
  has_many :scenarios, through :chapters
end
