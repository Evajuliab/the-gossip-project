class Gossip < ApplicationRecord
   belongs_to :user
   has_many :joins
   has_many :tags, through: :joins
   validates :title, presence: true, length: {in: 3..14}
   validates :content, presence: true
   has_many :comments
end
