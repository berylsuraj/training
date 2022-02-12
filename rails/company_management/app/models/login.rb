class Login < ApplicationRecord
  belongs_to :employee
  validates :username, presence: {message: "Username cannot be blank "} 
  validates :password, length: { in: 6..20}
  validates :employee, presence: true, uniqueness: {message: "This employee has already registered"}
  validates :username,  uniqueness: {message: -> (object, data) do "This #{object}, #{data} is already taken" end }, on: :create
  validates :username, presence: true, if: :login_type_method?


  def login_type_method?
    if username.include?"@"
      #debugger
      self.login_type="email"
    else
      self.login_type="phone"
    end
  end


end
