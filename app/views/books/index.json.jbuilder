json.array!(@books) do |book|
  json.extract! book, :id, :reference, :author, :title, :publisher, :volume, :number, :series, :address, :edition, :year, :month, :note, :tags
  json.url book_url(book, format: :json)
end
