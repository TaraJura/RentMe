class CopyDataFromAccountsToUsers < ActiveRecord::Migration[6.1]
  def change
    return if !defined? Account
    Account.all.each do |account|
      User.new(account.attributes.reject{ |k, v| k == "id" }).save(validate: false)
    end
  end
end
