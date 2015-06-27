class Article < ActiveRecord::Base
	has_many :imgs
	has_many :headers
	has_many :paragraphs, through: :headers
	has_one :user
end

