class Book < ApplicationRecord
	
  belongs_to :user

  validates :body, presence:true, length: { in: 1..200}
  validates :title, presence: true
end
