class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :email, :enterprise_id, :password, :pass_confirmation
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on =>:create
  validates_presence_of :enterprise_id
  validates_uniqueness_of :enterprise_id
  validates_presence_of :email

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(enterprise_id, password)
    user = find_by_enterprise_id(enterprise_id)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
