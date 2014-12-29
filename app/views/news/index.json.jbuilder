json.array!(@news) do |news|
  json.extract! news, :id, :status, :published_at
  json.url news_url(news, format: :json)
end
