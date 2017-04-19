# json.messages @messages do |message|
#   json.user_name message.user.name
#   json.id message.id
#   json.body message.body
#   json.image message.image
#   json.created_at message.created_at
# end

json.messages @messages do |message|
  json.partial! "messages/message", message: message
end
