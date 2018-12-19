# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: { message: "Must have password" }
    validates :password, length: { minimum: 6, allow_nil: true }
    before_validation :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username)
        if user && (BCrypt::Password.create(user.password_digest).is_password?(password))
            return user
        else
            nil
        end
    end

    def self.generate_session_token 
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def password=(value)
        @password = value
        self.password_digest = BCrypt::Password.create(@assword)
    end
end
