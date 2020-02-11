class ApplicationMailbox < ActionMailbox::Base
  routing /.{1,}/i => :processor
end
