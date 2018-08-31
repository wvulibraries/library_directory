require 'rails_helper'
require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:building) { double('building') }
  let(:uploader) { ImageUploader.new(building, :image) }

  before do
    ImageUploader.enable_processing = true
    File.open("#{Rails.root}/spec/support/files/test_1.jpg") { |f| uploader.store!(f) }
  end

  after do
    ImageUploader.enable_processing = false
    uploader.remove!
  end

  context 'it resizes the image' do
    it 'scales down larger images to 800 by 800 pixels' do
      expect(uploader).to be_no_larger_than(800,800)
    end 
    it 'scales down a landscape image to fit within 300 by 300 pixels' do
      expect(uploader.small).to be_no_larger_than(300, 300)
    end
  end

  context 'secruity concerns' do
    it 'makes the image readable only to the owner and not executable' do
      expect(uploader).to have_permissions(0o644)
    end

    it 'has the correct format' do
      expect(uploader).to be_format('jpeg')
    end
  end

  context 'coverage report' do
    it 'checks cache folder' do
      tmp_path = "#{Rails.root}/public/uploads/test/tmp/"
      expect(uploader.cache_dir).to eq(tmp_path)
    end 
    it 'checks upload folder' do
      up_path = "#{Rails.root}/public/uploads/test/r_spec/mocks/double/"
      expect(uploader.store_dir).to eq(up_path)
    end
    it 'checks whitelist types' do
      files =  %w[jpg jpeg png gif]
      expect(uploader.extension_whitelist).to eq(files)
    end
    it 'expects a default file' do
      expect(uploader.default_url).to eq('/default/default_building.jpg')
    end
  end
end
