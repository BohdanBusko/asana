class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    if request.env["omniauth.auth"].info.email.blank?
      redirect_to "/users/auth/facebook?auth_type=rerequest&scope=email"
      return
        user = User.where(email: auth.info.email).first
        if user
          return user
        else
          where(provider: auth.provider, uid: auth.uid).first do |user|
            user.password = Devise.friendly_token[0,20]
            user.full_name = auth.info.name
            user.email = auth.info.email ||= noemail@email.com
            user.uid = auth.uid
            user.provider = auth.provider
            user.oauth_token = auth.credentials.token
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
            user.save!
            # user.skip_confirmation!
          end
        end
      end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
