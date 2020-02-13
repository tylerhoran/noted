class ProcessorMailbox < ApplicationMailbox
  def process
    return if user.nil?
    folder = user.folders.find_by(name: 'Inbox')
    note = user.notes.create(text: mail.parts[0].body.decoded, folder: folder)
    ProcessEntities.perform_async(note.id)
  end

  def user
    @user = User.find_by(email: mail.from)
  end
end
