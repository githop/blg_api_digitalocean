class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :sentiment_rank
  attribute :posted_on, :key => :postedOn

  has_many :imgs, :headers, :paragraphs
  belongs_to :user

  url :article
end
