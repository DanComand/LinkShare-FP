class Bookmark < ActiveRecord::Base
	validates :url, presence: true
end
