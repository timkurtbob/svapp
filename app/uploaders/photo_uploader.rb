class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    ts = Time.now.to_s[0..-7]

    return "attachments/#{original_filename}_#{ts}"
  end
end
