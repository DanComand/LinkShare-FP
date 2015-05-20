class Bookmark < ActiveRecord::Base
	validates :url, presence: true
	has_many :comments
end
