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

  def disable_booth(booth, day, company)
    # is booth taken or closed?
    return true if booth.send("is_"+day+"_taken") || booth.send("is_"+day+"_unavailable")
    # is this booth non-extendible at the same time as the company wants an extended booth?
    return true if booth.mode == 0 && company.extended
    # is this extended-only and company non-extended?
    return true if booth.mode > 1 && !company.extended
    return false
  end

  def booth_class(booth, day, company)
    disable_booth(booth, day, company) ? 'disabled' : ''
  end
end
