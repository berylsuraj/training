class Account < ApplicationRecord
	belongs_to :employee
	has_one :account_history
end
