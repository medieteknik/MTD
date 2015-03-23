class Image < ActiveRecord::Base
  # relations
  belongs_to :user
  has_and_belongs_to_many :photo_albums

  # delete remote image on destroy
  before_destroy :delete_image

  def public_url
    return ENV['S3_BUCKET_ASSET_HOST'] + fix_path(filepath) if ENV['S3_BUCKET_ASSET_HOST'] && ENV['S3_BUCKET_ASSET_HOST'].present?
    url
  end

  def public_thumb_url
    return ENV['S3_BUCKET_ASSET_HOST'] + fix_path(thumb_path) if ENV['S3_BUCKET_ASSET_HOST'] && ENV['S3_BUCKET_ASSET_HOST'].present? && thumb_url
    return thumb_url if thumb_url
    public_url()
  end

  # create thumbnail and push it to remote
  def create_thumbnail(height = 200, width = 200, filename = 'img.jpg', unique_id = 'no_unique_id')
    img = MiniMagick::Image.open(url)
    # resize_to_fill from carrierwave! neat snippet.
    # http://www.rubydoc.info/github/jnicklas/carrierwave/CarrierWave/MiniMagick:resize_to_fill
    cols, rows = img[:dimensions]
    img.combine_options do |cmd|
      if width != cols || height != rows
        scale_x = width/cols.to_f
        scale_y = height/rows.to_f
        if scale_x >= scale_y
          cols = (scale_x * (cols + 0.5)).round
          rows = (scale_x * (rows + 0.5)).round
          cmd.resize "#{cols}"
        else
          cols = (scale_y * (cols + 0.5)).round
          rows = (scale_y * (rows + 0.5)).round
          cmd.resize "x#{rows}"
        end
      end
      cmd.gravity 'Center'
      cmd.background "rgba(255,255,255,0.0)"
      cmd.extent "#{width}x#{height}" if cols != width || rows != height
    end

    thumb_path = "#{Rails.root}/tmp/uploads-thumbs-#{Time.now.to_i}-#{SecureRandom.hex}-#{filename}".to_s
    img.write(thumb_path)

    # prepare thumbnail upload
    thumb_key = 'uploads/'+Time.now.to_i.to_s+'-'+unique_id.to_s+'-thumb-'+SecureRandom.hex.to_s+'/'+filename
    # upload to s3 using fog
    setup_fog
    file = @dir.files.create(
      :key    => thumb_key,
      :body   => File.open(thumb_path),
      :public => true
    )
    # get s3 file url
    new_url = S3_BUCKET.objects[file.key].public_url(secure: true)
    # update current record
    update_attribute(:thumb_url, new_url.to_s)
    update_attribute(:thumb_path, file.key)
  end

  private
    def delete_image
      setup_fog
      if self.filepath?
        pathname = fix_path(self.filepath)
        file = @dir.files.new(:key => pathname)
        file.destroy
      end
      if self.thumb_path?
        pathname = fix_path(self.thumb_path)
        file = @dir.files.new(:key => pathname)
        file.destroy
      end
    end

    def setup_fog
      connection = Fog::Storage.new({
        :provider                 => 'AWS',
        :aws_access_key_id        => ENV['AWS_ACCESS_KEY_ID'],
        :aws_secret_access_key    => ENV['AWS_SECRET_ACCESS_KEY'],
        :region                   => ENV['AWS_REGION']
      })

      @dir = connection.directories.get(ENV['S3_BUCKET_NAME'], prefix: '/')
    end

    def fix_path(the_path)
      the_path[0] == '/' ? the_path[1..-1] : the_path
    end
end
