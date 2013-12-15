# encoding: utf-8

class PostPhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "system/uploads/#{model.class.model_name.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "/images/fallback/#{model.class.model_name.to_s.underscore}/" << [mounted_as, version_name].compact.join("_") << ".gif"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  version :thumb do
    process resize_to_fit: [200, 200]
  end
end
