class User < ApplicationRecord
  has_many :word_books, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable, :omniauthable, omniauth_providers:[:twitter]

  validates :name, presence: true

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider     = auth["provider"]
      user.uid          = auth["uid"]
      user.name         = auth["info"]["nickname"]
      user.email        = auth["info"]["email"] unless auth["info"]["email"].nil?
      user.confirmed_at = Time.zone.now if create
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  # Devise method Override (OmniAuthで認証したユーザーのパスワード入力が免除)
  def password_required?
    super && provider.blank?
  end

  # Devise method Override (OmniAuthで認証したユーザーのメールアドレス入力が免除)
  def email_required?
    super && provider.blank?
  end

  # Devise method Override (OmniAuthで認証したユーザーのパスワード入力が免除)
  def update_with_password(params, *options)
    if encrypted_password.blank?
      params.delete(:password)
      params.delete(:password_confirmation)
      params.delete(:current_password)
      update_attributes(params, *options)
    else
      super
    end
  end
end
