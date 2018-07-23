class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  
  # directories to use for cache and storage
  def cache_dir
    "#{Rails.root}/public/uploads/#{Rails.env}/tmp"
  end

  def store_dir
    "#{Rails.root}/public/uploads/#{Rails.env}/#{model.class.to_s.underscore}/"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #     #"/images/fallback/" + [version_name, "default_#{model.class.to_s.underscore}.jpg"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process resize_to_fit: [800, 800]
  
  # Create different versions of your uploaded files:
  version :small do
    process resize_to_fit: [300, 300]
  end

  def extension_whitelist
    %w[jpg jpeg png]
  end
end
