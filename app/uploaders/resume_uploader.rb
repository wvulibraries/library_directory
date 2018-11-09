# Resume based on documentation from carrierwave.
#
# @author David J. Davis
# @uploader
# @since 0.0.1
class ResumeUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  # rename so no conflicts happen
  def filename
    @name ||= "#{file.basename}_#{Time.now.to_i}.#{file.extension}" unless file.nil? 
  end

  # directories to use for cache and storage
  def cache_dir
    "#{Rails.root}/public/uploads/#{Rails.env}/resume/tmp/"
  end

  # store directory
  def store_dir
    "#{Rails.root}/public/uploads/#{Rails.env}/resume/#{model.class.to_s.underscore}/"
  end

  # extension whitelist
  def extension_whitelist
    %w[pdf]
  end
end
