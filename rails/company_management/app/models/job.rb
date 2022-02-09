class Job < ApplicationRecord
	belongs_to :employee
	belongs_to :company
end
