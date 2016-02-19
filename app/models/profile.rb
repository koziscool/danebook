class Profile < ActiveRecord::Base
  belongs_to :user, inverse_of: :profile


  validates :user, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
end
