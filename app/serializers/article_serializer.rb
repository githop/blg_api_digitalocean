class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :posted_on

  has_many :imgs, :headers, :paragraphs
  belongs_to :user

  url :article
end
