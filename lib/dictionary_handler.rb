class DictionaryHandler
  def initialize(dict)
    @dict = dict
  end

  def parse_words(words)
    words.scan(/\w[A-z\uffe2\u0027\u2019]+/)
  end

  # searches dictionary hash with provided words array,
  # returns array of integers based upon sentiment rank.
  # sentiments: 1 == positive, -1 == negative, 0 == neutral
  def search_dictionary(words)
    word_ranks = []
    parse_words(words).each do |para_word|
      #search hash by key
      word_rank = @dict[para_word]

      #if we have a match, return it
      word_ranks << word_rank if word_rank
    end
    word_ranks
  end

  # returns sum total of analyzed words
  def rank_words(words)
    words = search_dictionary(words)
    words.empty? ? 0 : words.inject(:+)
  end

  # returns count of positive, negative, and neutral words as array
  def analyze_words(words)
    pos_words = 0
    neg_words = 0
    neu_words = 0
    search_dictionary(words).each do |w|
      case w
      when 1
        pos_words +=1
      when -1
        neg_words +=1
      when 0
        neu_words +=1
      end
    end
    [pos_words,neg_words,neu_words]
  end

end
