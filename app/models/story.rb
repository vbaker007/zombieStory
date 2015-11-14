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
        aws_access_key_id: "AKIAI43YBAWKDLKZABOQ",
        aws_secret_access_key: "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"
    },
    fog_directory: "rails-demo1-env"

  has_many :chapters
  has_many :scenarios, through: :chapters
end
