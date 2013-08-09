class AddSmsSentAtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sms_sent_at, :date
  end
end
