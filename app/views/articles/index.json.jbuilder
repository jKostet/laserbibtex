json.array!(@articles) do |article|
  json.extract! article, :id, :author, :title, :journal, :year, :volume, :number, :pages, :month, :note, :key
  json.url article_url(article, format: :json)
end
