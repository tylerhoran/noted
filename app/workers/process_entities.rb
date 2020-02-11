class ProcessEntities
  include Sidekiq::Worker

  def perform(note_id)
    note = Note.find(note_id)
    comprehend = Aws::Comprehend::Client.new
    response = comprehend.detect_entities({text: note.text, language_code: 'en'})
    note.update(entities: response.to_hash
  end
end
