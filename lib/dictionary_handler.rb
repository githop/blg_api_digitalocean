class DictionaryHandler
  def initialize(dict)
    @dict = dict
  end

  # parses input string into array
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
      word_rank = @dict[para_word.downcase]

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
    pos_count = 0
    neg_count = 0
    neu_count = 0
    search_dictionary(words).each do |w|
      case w
      when 1
        pos_count +=1
      when -1
        neg_count +=1
      when 0
        neu_count +=1
      end
    end
    {positive: pos_count, negative: neg_count, neutral: neu_count}
  end

  # returns uniqe array of words that have been analyzed with their sentiment. 
  def analyzed_words(words)
    analyzed_words = []
    parse_words(words).each do |word|
      word_rank = @dict[word.downcase]

      if word_rank
        analyzed_words << { word: word, sentiment: word_rank }
      end
    end
    analyzed_words.uniq
  end

end
