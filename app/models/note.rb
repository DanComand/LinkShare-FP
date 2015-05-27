class Note < ActiveRecord::Base
	belongs_to :bookmark
	belongs_to :user

	validates :comment, presence: true
end
