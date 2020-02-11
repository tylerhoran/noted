class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  after_create :create_default_folder
  has_many :folders, dependent: :destroy
  has_many :notes, through: :folders

  private

  def create_default_folder
    folders.create!(name: "Inbox")
  end
end
