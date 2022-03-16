json.id @writer.id
json.name @writer.name


json.book do
  json.id @writer.books.last.id
  json.name @writer.books.last.name
end