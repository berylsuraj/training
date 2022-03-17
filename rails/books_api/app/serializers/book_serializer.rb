class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :writer_id
end