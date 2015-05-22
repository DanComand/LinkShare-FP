class Bookmark < ActiveRecord::Base
	validates :url, presence: true
	belongs_to :user
	has_many :notes
end
