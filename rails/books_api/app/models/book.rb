class Book < ApplicationRecord
  validates :name, presence: true
  belongs_to :writer

end
