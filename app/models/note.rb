class Note < ApplicationRecord
  belongs_to :folder
  serialize :entities

  before_save :set_entities

  private

  def set_entities
    comprehend = Aws::Comprehend::Client.new
    response = comprehend.detect_entities({text: text, language_code: 'en'})
    self.entities = response.to_hash
  end
end
