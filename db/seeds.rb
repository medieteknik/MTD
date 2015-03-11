# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

['SuperAdmin', 'Admin', 'CompanyRepresentative', 'Photographer', 'Speaker'].each do |role|
  Role.find_or_create_by({name: role})
end

host_positions = [
  { position_sv: 'Receptionsvärd', position_en: 'Reception host' },
  { position_sv: 'Loungevärd', position_en: 'Lounge host' },
  { position_sv: 'Företagsvärd', position_en: 'Company host' },
  { position_sv: 'Chaufför', position_en: 'Driver' },
  { position_sv: 'Fotovärd', position_en: 'Photographer' },
  { position_sv: 'Teknikvärd', position_en: 'Technician' },
  { position_sv: 'Journalistvärd', position_en: 'Journalist' },
  { position_sv: 'Konferencier', position_en: 'Speaker' },
  { position_sv: 'Eventvärd', position_en: 'Event host' },
  { position_sv: 'Gymnasievärd', position_en: 'High school host' }
]

host_positions.each_index do |i|
  I18n.locale = 'sv'
  pos = HostPosition.find_or_create_by({position: host_positions[i][:position_sv]})
  I18n.locale = 'en'
  pos.position = host_positions[i][:position_en]
  pos.save
end

# mode
# 0 = 2x2
# 1 = 2x2, extendible
# 3 = 3x3
booths = [
  { first_day: true, second_day: true, mode: 0, number: 1 },
  { first_day: true, second_day: true, mode: 2, number: 2 },
  { first_day: true, second_day: true, mode: 0, number: 3 },
  { first_day: true, second_day: true, mode: 0, number: 4 },
  { first_day: true, second_day: true, mode: 0, number: 5 },
  { first_day: true, second_day: true, mode: 0, number: 6 },
  { first_day: true, second_day: true, mode: 0, number: 7 },
  { first_day: true, second_day: true, mode: 0, number: 8 },
  { first_day: true, second_day: true, mode: 0, number: 9 },
  { first_day: true, second_day: true, mode: 0, number: 10 },
  { first_day: true, second_day: true, mode: 0, number: 11 },
  { first_day: true, second_day: true, mode: 1, number: 12 },
  { first_day: true, second_day: true, mode: 1, number: 13 },
  { first_day: true, second_day: true, mode: 1, number: 14 },
  { first_day: true, second_day: true, mode: 1, number: 15 },
  { first_day: true, second_day: true, mode: 1, number: 16 },
  { first_day: true, second_day: true, mode: 1, number: 17 },
  { first_day: true, second_day: true, mode: 1, number: 18 },
  { first_day: true, second_day: true, mode: 1, number: 19 },
  { first_day: true, second_day: true, mode: 1, number: 20 },
  { first_day: true, second_day: true, mode: 1, number: 21 },
  { first_day: true, second_day: true, mode: 1, number: 22 },
  { first_day: true, second_day: true, mode: 1, number: 23 },
  { first_day: true, second_day: true, mode: 1, number: 24 },
  { first_day: true, second_day: true, mode: 1, number: 25 },
  { first_day: true, second_day: true, mode: 1, number: 26 },
  { first_day: true, second_day: true, mode: 1, number: 27 },
  { first_day: true, second_day: true, mode: 1, number: 28 },
  { first_day: true, second_day: true, mode: 1, number: 29 },
  { first_day: true, second_day: true, mode: 0, number: 30 },
  { first_day: true, second_day: true, mode: 0, number: 31 },
  { first_day: true, second_day: true, mode: 0, number: 32 },
  { first_day: true, second_day: true, mode: 2, number: 33 },
  { first_day: true, second_day: true, mode: 0, number: 34 },
  { first_day: true, second_day: true, mode: 0, number: 35 },
  { first_day: true, second_day: true, mode: 2, number: 36 }
]

booths.each do |booth|
  b = Booth.find_or_create_by({number: booth["number"]})
  b.update_attributes(booth)
end
