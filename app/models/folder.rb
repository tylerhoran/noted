class Folder < ApplicationRecord
  belongs_to :user
  has_many :notes, dependent: :destroy
  has_ancestry

  def inbox?
    name == 'Inbox'
  end
end
