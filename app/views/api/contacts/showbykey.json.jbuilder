if @contact
  json.id @contact.id
  json.key @contact.key
  json.name @contact.name
  json.email @contact.email
  json.message @contact.message
  json.visits @contact.visits do |visit|
    json.id visit.id
    json.page visit.page
    json.when visit.when
  end
end
