class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" },
    :default_url => "/images/:style/missing.png",
    :url  => ":s3_domain_url",
    :path => "public/avatars/:id/:style_:basename.:extension",
    :storage => :fog,
    :fog_credentials => {
        provider: 'AWS',
        aws_access_key_id: ENV["AWS_ACCESS_KEY_ID"],
        aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"]
    },
    fog_directory: ENV["FOG_DIRECTORY"]
  has_many :readings
  devise :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable, 
          :omniauthable, 
          :omniauth_providers => [:facebook]
  

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
      user.oauth_token = auth.credentials.token 
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

 def facebook
  @facebook ||= Koala::Facebook::API.new(oauth_token)
  block_given? ? yield(@facebook) : @facebook
rescue Koala::Facebook::APIError => e
  logger.info e.to_s
  nil # or consider a custom null object
end

def friends_count
  facebook { |fb| fb.get_connection("me", "friends").size }
end

  


  #def update_reading(story_id, chapter_id, scenario_id, complete = true || false)
    #self.readings.each do |reading|
    #  reading.story_id = story_id
     # reading.chapter_id = chapter_id
     # reading.scenario_id = scenario_id
     # reading.complete = complete
    # reading.save
    #end
  #end
end


