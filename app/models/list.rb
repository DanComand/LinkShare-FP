class List < ActiveRecord::Base
	has_many :bookmarks
	has_many :invites
	belongs_to :user
end
