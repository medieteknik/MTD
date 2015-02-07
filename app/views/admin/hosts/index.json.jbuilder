json.array!(@hosts) do |host|
  json.(host, *host.attributes.keys)
  json.first HostPosition.find(host.first).position
  json.second HostPosition.find(host.second).position
  json.third HostPosition.find(host.third).position
  json.public_url show_host_path(host.id, host.liuid)
  json.admin_url admin_host_path(host)
end
