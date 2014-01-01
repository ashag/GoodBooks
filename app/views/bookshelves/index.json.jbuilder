json.array!(@bookshelves) do |bookshelf|
  json.extract! bookshelf, :id
  json.url bookshelf_url(bookshelf, format: :json)
end
