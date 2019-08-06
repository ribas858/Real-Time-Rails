class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true

  def message
    self.message
  end
end
