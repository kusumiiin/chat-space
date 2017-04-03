json.message do
  json.partial! "messages/message", message: @message
end

json.flash do
  json.flash flash[:success]
end
