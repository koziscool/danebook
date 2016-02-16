class User < ActiveRecord::Base
  has_secure_password

  before_create :generate_token

  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_one :profile, inverse_of: :user

  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  has_many :friendings_initiated, class_name: "Friending", foreign_key: :initiator_id
  has_many :friends_initiated, through: :friendings_initiated, source: :recipient

  has_many :friendings_received, class_name: "Friending", foreign_key: :recipient_id
  has_many :friends_received, through: :friendings_recieved, source: :initiator


  accepts_nested_attributes_for :profile

  validates :password,
            :length => {:in => 2..24 },
            :allow_nil => true


  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!

  end  

  def liked_resource?(resource)
    self.likes.each do |like|
      return true if like.likeable_type.constantize.find(like.likeable_id) == resource
    end
    false
  end

  def id_of_like(resource)
    self.likes.each do |like|
      return like.id if like.likeable_type.constantize.find(like.likeable_id) == resource
    end
  end

end
