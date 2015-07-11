class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title
  attribute :sentiment_rank, :key => :sentimentRank
  attribute :posted_on, :key => :postedOn
  attribute :positive_wc, :key => :positiveWc
  attribute :negative_wc, :key => :negativeWc
  attribute :neutral_wc, :key => :neutralWc

  has_many :imgs, :headers, :paragraphs
  belongs_to :user

  url :article
end
