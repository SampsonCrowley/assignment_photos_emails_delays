
class User < ApplicationRecord
  after_create :send_welcome

  attr_reader :photo_data

  has_attached_file :avatar, styles: {medium: '300x300>', thumb: "100x100>"}, default_url: "https://s3.amazonaws.com/viking_education/web_development/web_app_eng/user_silhouette_generic.gif"

  validates_attachment_content_type :avatar, content_type: /\Aimage.*\Z/

  def photo_data_local=(data)
    self.profile_photo_local_type = data.content_type


    filename = "public/uploads/#{SecureRandom.urlsafe_base64}-#{data.original_filename}".downcase!
    filepath = Rails.root.join(filename)

    self.profile_photo_local = filename

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

  private
    def send_welcome
      UserMailer.welcome(self).deliver
    end
    handle_asynchronously :send_welcome
end
