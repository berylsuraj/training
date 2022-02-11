class Company < ApplicationRecord
	has_many :jobs
	has_many :employees, through: :jobs
  has_many :projects, as: :projectable
end
