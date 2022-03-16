class Writer < ApplicationRecord
  has_many :books
  validates :name, uniqueness: true, presence: true
end
