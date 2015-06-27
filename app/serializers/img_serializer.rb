class ImgSerializer < ActiveModel::Serializer
  attributes :id, :href, :title

  belongs_to :article
end
