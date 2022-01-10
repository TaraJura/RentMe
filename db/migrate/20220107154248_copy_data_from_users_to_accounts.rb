class CopyDataFromUsersToAccounts < ActiveRecord::Migration[6.1]
  def change
    return if !defined? User
    User.all.each do |user|
      password = SecureRandom.hex(10)
      Account.create!(email:user.name.downcase + "@vmin.cz", password: password, password_confirmation: password, phone: user.phone) 
    end
  end
end
