class Bookmark < ActiveRecord::Base
	validates :url, presence: true
	belongs_to :user
	belongs_to :list
	has_many :notes
end
