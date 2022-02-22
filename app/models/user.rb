class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true

  private

  def generate_token
      loop do
        token = SecureRandom.hex
        return token unless User.exists?({token: token})
      end
   end
end
