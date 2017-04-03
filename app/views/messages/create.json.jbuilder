json.message do
  json.partial! "messages/message", message: @message
end
