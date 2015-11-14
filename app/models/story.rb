class Story < ActiveRecord::Base
  has_attached_file :image, styles: { large: "900x900>", medium: "300x300>", thumb: "150x150" } 
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
    :url  => ":http://darkshelters.herokuapp.com/",
    :path => "public/images/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]
  has_many :chapters
  has_many :scenarios, through: :chapters
end
