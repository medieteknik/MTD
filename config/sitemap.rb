# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.medieteknikdagarna.se"

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
