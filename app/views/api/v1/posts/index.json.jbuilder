json.array! @posts do |p|
  json.id p.id
  json.title p.title
  json.body p.body
  json.user do
    json.id p.user.id
    json.name p.user.name
  end
end
