CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog

    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'

    config.fog_credentials = {
      :provider               => 'AWS',              # required
      :aws_access_key_id      => ENV['S3_KEY'],      # required
      :aws_secret_access_key  => ENV['S3_SECRET'],   # required
      :region                 => ENV['S3_REGION'],   # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = ENV['S3_BUCKET_NAME']                   # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
end