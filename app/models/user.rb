class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	has_secure_password
	has_many :bookmarks
end
