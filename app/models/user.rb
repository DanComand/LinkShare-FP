class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_secure_password
	has_many :lists
	has_many :bookmarks, through: :lists
	has_many :reviews

	has_many :invites
  has_many :invited_lists, through: :invites, source: :list

end
