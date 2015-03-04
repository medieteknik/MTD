module CompaniesHelper
  def attendance(company)
    return t('companies.show.attending.both') if company.first_day && company.second_day
    return t('companies.show.attending.first') if company.first_day && !company.second_day
    return t('companies.show.attending.second')
  end

  def sponsor(company)
    return company.name + " " + t('companies.show.sponsor.gold') if company.sponsor == 'gold'
    return t('companies.show.sponsor.fair') if company.sponsor == 'fair'
    return company.name + " " + t('companies.show.sponsor.sponsor')
  end
end
