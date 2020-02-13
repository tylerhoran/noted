class ProcessorMailbox < ApplicationMailbox
  def process
    return if user.nil?
    folder = user.folders.find_by(name: 'Inbox')
    user.notes.create(text: mail.parts[0].body.decoded, folder: folder)
  end

  def user
    @user = User.find_by(email: mail.from)
  end
end
