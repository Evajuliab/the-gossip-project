class User < ApplicationRecord
   has_many :gossips
   belongs_to :city, optional: true
   has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
   has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
   has_secure_password 
   validates :password, presence: true, length: { minimum: 6 }
end
