class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  def public_id
    ts = Time.now.to_s[0..-7].gsub(/\s+/, "_-_")

    return "attachments/#{original_filename}_--_#{ts}"
  end
end
