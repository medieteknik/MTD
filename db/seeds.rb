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
