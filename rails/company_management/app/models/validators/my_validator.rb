class MyValidator < ActiveModel::Validator

  def validate(record)
    unless record.account_num.length>=7 && record.account_num.scan(/\D/)
      record.errors.add :name, "Enter a valid acount number "
    end
  end
end