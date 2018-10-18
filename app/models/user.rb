class User < ApplicationRecord
  has_many :projects
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :full_name, length: { maximum: 250 }, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.password = Devise.friendly_token[0,20]
        user.full_name = auth.info.name
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
