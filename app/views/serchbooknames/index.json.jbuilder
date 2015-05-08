json.array!(@serchbooknames) do |serchbookname|
  json.extract! serchbookname, :id, :word, :email
  json.url serchbookname_url(serchbookname, format: :json)
end
