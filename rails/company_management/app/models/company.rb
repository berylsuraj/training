class Company < ApplicationRecord
	has_many :jobs, dependent: :destroy
	has_many :employees, through: :jobs
  has_many :projects, as: :projectable
  validates :name, presence: {message: "Company name should be present"}
  before_validation :normalize_name, on: [:create,:update]

  def normalize_name
    unless name.blank?
      self.name = name.capitalize
    end
  end

  after_destroy :delete_company 

  def delete_company
    puts "Destroyed"

  end

  after_initialize do |company|
    puts "You initilized a new company"
  end

  after_find do |company|
    puts "You are finding new comany"
  end


end
