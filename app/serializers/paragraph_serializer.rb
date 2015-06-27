class ParagraphSerializer < ActiveModel::Serializer
  attributes :id, :body

  belongs_to :header
end
