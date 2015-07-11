class SentimentsController < ApplicationController
	def analyze
		rank = $dictionary_handler.rank_words(params[:words])
		word_counts = $dictionary_handler.analyze_words(params[:words])
		words = $dictionary_handler.analyzed_words(params[:words])
		render json: {rank: rank, wordCounts: word_counts, words: words }
	end
end
