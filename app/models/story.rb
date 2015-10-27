class Story < ActiveRecord::Base
  has_attached_file :image, styles: { large: "900x900>", medium: "300x300>", thumb: "150x150" } 
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :chapters
  has_many :scenarios, through: :chapters
end
