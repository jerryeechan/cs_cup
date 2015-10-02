
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

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
    scope :sport, -> (sport) { 
      if sport =='0'
        where(nil)
      else
      where sport: sport 
      end
    }
    scope :money_transfered, ->(is){
      puts "money_transfered"
      puts is
      if is == "on"
        where.not(transfercode: "請點擊填入轉帳代碼")
      else
        whrer(nil)
      end

    }
    scope :is_register_confirmed, ->(is){
      if is == "on"
        where(is_register_confirmed: true)
      else
        whrer(nil)
      end
    }
    scope :fbname, ->(name){
      puts name

      where "name like ?", "#{name}%"
    }
    def self.filter(filtering_params)
      results = self.all
      puts results
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end

    def self.search(search)
      search_condition = "%#{" + search + "}%"
     #@users = where(name: search)
     #@users = find(name: search)
     
      where('name LIKE ?', "%#{search}%")#find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    end

#name LIKE ? OR description LIKE ?

    has_and_belongs_to_many :talents ,:join_table =>'users_talents'
    has_many :posts
    has_and_belongs_to_many :teams ,:join_table =>'users_teams'
    
    
    def self.from_omniauth(auth)
    access_token = auth.credentials.token

    facebook = Koala::Facebook::API.new(access_token)
    public_attr = facebook.get_object("me") 
    
    if exists?(uid: auth.uid)
      
    else
      User.new.tap do |user|
        user.uid = auth.uid
        user.school = "請點擊填入學校"
      user.department = "請點擊填入系所"
      user.sport = "請點擊選擇球類項目"
      user.transfercode = "請點擊填入轉帳代碼"
      user.captain = "請點擊填入隊長姓名"
      user.save!
      end
    end


    where(uid: auth.uid).first.tap do |user|

      #user.email = auth.info.email
      puts "--debug print out"
      puts auth 
      puts auth.info
      puts auth["info"]
      puts user.email
      puts auth.extra.raw_info.email
      puts "debug print out"
      
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

  has_many :members

end