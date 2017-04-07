json.message do
  json.partial! "messages/message", message: @message
end

json.flash do
  flash.each do |key, value|
    json.set! key, value
  end
end
