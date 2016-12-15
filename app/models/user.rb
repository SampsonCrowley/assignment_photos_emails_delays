
class User < ApplicationRecord
  attr_reader :photo_data, :profile_photo_local


  def photo_data_local=(data)
    self.profile_photo_local_type = data.content_type


    filename = "#{SecureRandom.urlsafe_base64}-#{data.original_filename}".downcase!
    filepath = Rails.root.join('public', 'uploads', filename)

    binding.pry
    self.profile_photo_local = filepath

    File.open(filepath, 'wb') do |file|
       file.write(data.read)
    end
  end

  def profile_photo
    [self.profile_photo_data, self.profile_photo_type, self.profile_photo_name]
  end

  def photo_data=(data)
    self.profile_photo_data = data.read
    self.profile_photo_name = data.original_filename
    self.profile_photo_type = data.content_type
  end

end
