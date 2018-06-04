class Note < ApplicationRecord
	attr_accessor :libraries
		belongs_to :user
		mount_uploaders :libraries, LibraryUploader

  acts_as_taggable
end