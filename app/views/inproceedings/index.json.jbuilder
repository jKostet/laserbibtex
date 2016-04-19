json.array!(@inproceedings) do |inproceeding|
  json.extract! inproceeding, :id, :reference, :author, :title, :booktitle, :editor, :volume, :number, :series, :pages, :address, :organization, :publisher, :year, :month, :note
  json.url inproceeding_url(inproceeding, format: :json)
end
