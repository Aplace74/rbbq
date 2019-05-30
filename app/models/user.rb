class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :barbecues
  has_many :messages_as_receiver, foreign_key: 'receiver_id', class_name: 'Message'
  has_many :messages_as_sender, foreign_key: 'sender_id', class_name: 'Message'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  mount_uploader :avatar, PhotoUploader
end
