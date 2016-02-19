class Friending < ActiveRecord::Base
  belongs_to    :recipient, foreign_key: :recipient_id, class_name: "User"
  belongs_to    :initiator, foreign_key: :initiator_id, class_name: "User"

  validates :initiator, presence:true
  validates :recipient, presence:true,
        uniqueness: { scope: :initiator }

end
