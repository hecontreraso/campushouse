Fog.mock!
Fog.credentials = {
  aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  region:                ENV['AWS_S3_REGION']
} 
connection = Fog::Storage.new(:provider => 'AWS')
connection.directories.create(:key => 'campus-house-development')
