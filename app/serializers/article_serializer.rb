class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :imgs, :headers, :paragraphs

  url :article
end
