Paperclip::Attachment.default_options[:validate_media_type] = false

if Rails.env.development?
  {
    url: "/uploads/:class/:id/:attachment/:style/:filename",
    path: ':rails_root/public/uploads/:class/:id/:attachment/:style/:filename'
  }
elsif Rails.env.production?
  {
    storage: :s3,
    s3_credentials: {
      access_key_id:     ENV.fetch('AWS_ACCESS_KEY_ID'),
      secret_access_key: ENV.fetch('AWS_SECRET_ACCESS_KEY'),
      s3_region:         ENV.fetch('AWS_REGION'),
    },
    url: ':s3_alias_url',
    s3_protocol: :https,
    s3_host_alias: ENV.fetch('S3_HOST_ALIAS'),
    bucket: ENV.fetch('S3_BUCKET_NAME'),
    path: '/uploads/:class/:id/:attachment/:style/:filename'
  }
end.each do |k, v|
  Paperclip::Attachment.default_options[k] = v
end
