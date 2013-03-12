CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => "AWS",
    :aws_access_key_id      => ENV["AWS_KEY"],
    :aws_secret_access_key  => ENV["AWS_SECRET"],
    :host                   => "s3-eu-west-1.amazonaws.com",
    :region                 => "eu-west-1"
  }
  config.fog_directory  = "ijacek"
  config.fog_public     = true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
end