class AddPasswordRecoveryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_recovery_token, :string
    add_column :users, :password_recovery_sent_at, :datetime
  end
end
