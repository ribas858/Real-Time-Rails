class AddUserToToChatRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_rooms, :user_to, :bigint
  end
end
