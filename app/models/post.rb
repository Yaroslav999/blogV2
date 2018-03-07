class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	belongs_to :category
	mount_uploader :image, ImageUploader
	validates :title, :summary, :body, presence: true
end
