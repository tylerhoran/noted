class ApplicationMailbox < ActionMailbox::Base
  routing :all => :processor
end
