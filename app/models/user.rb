class User < ActiveRecord::Base
  has_many :rounds

  def password
    if password_digest.present?
      @password ||= BCrypt::Password.new(password_digest)
    end
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end

end
