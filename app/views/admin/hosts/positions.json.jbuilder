json.array!(@positions) do |position|
  json.extract! position, :id, :position, :need
  json.total Host.where(position: position.id).count
  json.first Host.where(first: position.id).count
  json.anywhere Host.where('first = ? OR second = ? OR third = ?', position.id, position.id, position.id).count
end
