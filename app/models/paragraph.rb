class Paragraph < ActiveRecord::Base
	belongs_to :header

	def get_words
		self.body.scan(/\w[A-z\uffe2\u0027\u2019]+/)
	end

	def rank_sentiments
		$dictionary_handler.analyze_words(get_words)
	end

	def overall_paragraph_sentiment
		rank = sentiments_rank
		case
		when rank < 0
			'negative'
		when rank > 0
			'positive'
		else
			'neutral'
		end
	end
end
