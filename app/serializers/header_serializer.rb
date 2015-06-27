class HeaderSerializer < ActiveModel::Serializer
  attributes :id, :text

  has_many :paragraphs
  belongs_to :article

end
