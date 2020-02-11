class Note < ApplicationRecord
  belongs_to :folder
  serialize :entities
end
