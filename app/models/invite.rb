class Invite < ActiveRecord::Base
	belongs_to :list
	belongs_to :user
  validates :email, presence: true
end
