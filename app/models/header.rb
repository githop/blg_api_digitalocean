class Header < ActiveRecord::Base
	belongs_to :article
	has_many :paragraphs
end
