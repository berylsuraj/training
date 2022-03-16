class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :writer_id
  belongs_to :writer
end