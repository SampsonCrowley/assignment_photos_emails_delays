class ProcessImageJob < ApplicationJob
  queue_as :default

  def perform(id, data)
    # Do something later
    user = User.find(id)
    user.process_photo(data)
    save
  end
end
