json.message do
  json.partial! "messages/message", message: @message
end

json.flash do
  json.set! :success, 'メッセージを送信しました'
end
