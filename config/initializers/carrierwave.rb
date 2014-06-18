CarrierWave.configure do |config|
  config.root = Rails.root.join('tmp')
  config.cache_dir = 'carrierwave'

  config.fog_credentials = {
    :provider               => 'AWS',              # required
    :aws_access_key_id      => ENV['S3_KEY'],      # required
    :aws_secret_access_key  => ENV['S3_SECRET'],   # required
    :region                 => ENV['S3_REGION'],   # optional, defaults to 'us-east-1'
    # :host                   => ENV['S3_HOST'],     # optional, defaults to nil
    # :endpoint               => ENV['S3_ASSET_URL'] # optional, defaults to nil
  }
  config.fog_directory  = ENV['S3_BUCKET_NAME']                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end