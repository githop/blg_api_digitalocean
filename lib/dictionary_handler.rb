class DictionaryHandler
  def initialize(dict)
    @dict = dict
  end

  def analyze_words(words)
    paragraph_rank = 0
    words.each do |para_word|
      #search hash by key
      word_rank = @dict[para_word]

      #if we have a match, rank it
      paragraph_rank += word_rank if word_rank
    end
    paragraph_rank
  end

end
