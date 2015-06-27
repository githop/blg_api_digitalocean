class Article < ActiveRecord::Base
	has_many :imgs, :headers
	has_many :paragraphs, through: :headers
end

