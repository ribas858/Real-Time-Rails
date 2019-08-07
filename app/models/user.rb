class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  def name
    email.split('@')[0]
  end
  has_many :notifications, as: :recipient
end
