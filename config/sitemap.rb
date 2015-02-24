# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.medieteknikdagarna.se"

# pick a place safe to write the files
SitemapGenerator::Sitemap.public_path = 'tmp/'
# store on S3 using Fog
SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new
# inform the map cross-linking where to find the other maps
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
# pick a namespace within your bucket to organize your maps
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.

  group(:filename => :en) do
    add '/en', :changefreq => 'daily', :priority => 1
    add '/en/about'
    add '/en/about/contact'
    add '/en/about/previous-years'
    add '/en/sponsorship'
    add '/en/sponsorship/compare'
    add '/en/sponsorship/compare/bronze'
    add '/en/sponsorship/compare/gold'
    add '/en/sponsorship/compare/silver'
  end

  group(:filename => :sv) do
    add '/sv', :changefreq => 'daily', :priority => 1
    add '/sv/om'
    add '/sv/om/kontakt'
    add '/sv/om/tidigare-ar'
    add '/sv/sponsor'
    add '/sv/sponsor/jamfor'
    add '/sv/sponsor/jamfor/brons'
    add '/sv/sponsor/jamfor/guld'
    add '/sv/sponsor/jamfor/silver'
  end
end
