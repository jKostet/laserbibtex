json.array!(@articles) do |article|
  json.extract! article, :id, :reference, :author, :title, :journal, :year, :volume, :number, :pages, :month, :note, :key, :tags
  json.url article_url(article, format: :json)
end
