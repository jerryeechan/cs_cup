
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable
  has_many :members,dependent: :destroy

 # def self.from_omniauth(auth)
 # 	puts auth;
  #  where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_initialize.tap do |user|

  #    user.provider = auth.provider
  #    user.uid = auth.uid
  #    user.name = auth.info.name
  #    user.oauth_token = auth.credentials.token
  #    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #    user.save!
  #  end
  #end
    def self.search(search)
      search_condition = "%#{" + search + "}%"
     #@users = where(name: search)
     #@users = find(name: search)
     
      where('name LIKE ?', "%#{search}%")#find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    end

#name LIKE ? OR description LIKE ?

#    has_and_belongs_to_many :talents ,:join_table =>'users_talents'
#    has_many :posts
#    has_and_belongs_to_many :teams ,:join_table =>'users_teams'
    
    
   def self.from_omniauth(auth)
    access_token = auth.credentials.token

    facebook = Koala::Facebook::API.new(access_token)
    public_attr = facebook.get_object("me") 
  
    where(uid: auth.uid).first_or_initialize.tap do |user|

      user.email = auth.info.email
      
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      
      user.image = auth.info.image
      user.link= auth.extra.raw_info.link
      user.gender = auth.extra.raw_info.gender
      puts user
      user.save!
  	end
  end


end