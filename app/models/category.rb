class Category < ApplicationRecord
	has_many :posts
	validates :name, :description, presence: true
end
