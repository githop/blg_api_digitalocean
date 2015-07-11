class Paragraph < ActiveRecord::Base
	belongs_to :header

	def get_words
		self.body
	end

	def get_sentiments
		$dictionary_handler.search_dictionary(get_words)
	end

	def rank_sentiments
		$dictionary_handler.rank_words(get_words)
	end

	def word_analysis
		$dictionary_handler.analyze_words(get_words)
	end

	def overall_paragraph_sentiment
		rank = rank_sentiments
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
