json.array!(@positions) do |position|
  json.extract! position, :id, :position, :need
end
