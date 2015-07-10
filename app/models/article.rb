class Article < ActiveRecord::Base

	after_save :analyze_sentiment, if: :not_analyzed?

	has_many :imgs
	has_many :headers
	has_many :paragraphs, through: :headers
	belongs_to :user

	def analyze_sentiment
		if paragraphs.any?
			self.sentiment_rank = overall_rank
			self.save
		end
	end

	def not_analyzed?
		self.sentiment_rank.nil?
	end

	def calc_overall_rank
		paragraphs.map(&:rank_sentiments).inject(:+)
	end

	def overall_sentiment
		rank = overall_rank
		case
		when rank < 0
			'negative'
		when rank > 0
			'positive'
		else
			'neutral'
		end
	end

	def self.blog_rank
		self.all.map(&:calc_overall_rank).inject(:+)
	end
end

