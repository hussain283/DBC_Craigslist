class Post < ActiveRecord::Base
  belongs_to :category
  before_create :generate_token

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(n=nil, padding=false)
      break random_token unless Post.where(token: random_token).exists?
    end
  end

end