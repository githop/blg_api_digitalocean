class Article < ActiveRecord::Base

	after_save :analyze_article, if: :not_analyzed?

	has_many :imgs
	has_many :headers
	has_many :paragraphs, through: :headers
	belongs_to :user

	def analyze_article
		if paragraphs.any?
			self.sentiment_rank = calc_overall_rank

			wc = self.paragraph_word_analysis
			self.positive_wc = wc[:postive]
			self.negative_wc = wc[:negative]
			self.neutral_wc = wc[:neutral]

			self.save
		end
	end

	def not_analyzed?
		self.sentiment_rank.nil?
	end

	def calc_overall_rank
		paragraphs.map(&:rank_sentiments).inject(:+)
	end

	def paragraph_word_analysis
		words = paragraphs.map(&:word_analysis)
		pos_count = 0
		neg_count = 0
		neu_count = 0
		words.each do |word_count|
			pos_count += word_count[0]
			neg_count += word_count[1]
			neu_count += word_count[2]
		end
		{postive: pos_count, negative: neg_count, neutral: neu_count}
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

