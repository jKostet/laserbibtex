json.array!(@books) do |book|
  json.extract! book, :id, :id, :author, :title, :publisher, :volume, :number, :series, :address, :edition, :year, :month, :note
  json.url book_url(book, format: :json)
end
