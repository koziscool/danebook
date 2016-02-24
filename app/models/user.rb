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

  # has_attached_file :avatar, :styles => { :medium => "300x300", :thumb => "100x100" }
  # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  # has_attached_file :cover_photo, :styles => { :medium => "300x300", :thumb => "100x100" }
  # validates_attachment_content_type :cover_photo, :content_type => /\Aimage\/.*\Z/

  has_many :photos
  belongs_to :avatar,  class_name: "Photo", foreign_key: :avatar_id
  
  # belongs_to :cover_photo,  class_name: "Photo"


  validates :password,
            :length => {:in => 2..24 },
            :allow_nil => true

  validates :email,   presence: true,
                    uniqueness: true


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

  def full_name
    first_name + " " + last_name
  end

  def self.send_welcome_email(id)
    user = User.find(id)
    mail = UserMailer.welcome(user)
    mail.deliver
  end


end
