class ProcessEntities
  include Sidekiq::Worker

  def perform(note_id)
    note = Note.find(note_id)
    comprehend = Aws::Comprehend::Client.new
    responses = []
    note.text.to_s.to_2d_array(5000).each do |chunk|
      responses << comprehend.detect_entities({text: note.text, language_code: 'en'}).to_hash[:entities]
    end
    note.update(entities: responses.flatten)
  end

end
