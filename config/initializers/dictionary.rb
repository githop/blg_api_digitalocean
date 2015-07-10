require 'dictionary_handler'
require 'csv'

dict = {}
CSV.foreach('./db/dictionary.csv', headers:true) do |row|
  case
  when row['sentiment'] == 'positive'
    row['sentiment'] = 1
  when row['sentiment'] == 'negative'
    row['sentiment'] = -1
  when row['sentiment'] == 'neutral'
    row['sentiment'] = 0
  end
  dict[row['word']] = row['sentiment']
end

$dictionary_handler = DictionaryHandler.new(dict)
