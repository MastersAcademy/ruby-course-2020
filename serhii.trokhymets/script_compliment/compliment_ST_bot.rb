# frozen_string_literal: true
require 'telegram/bot'
require_relative 'compliment'
include Compliment

token = '1202538978:AAHb7g8D-JXtzVLAdp5y3X1o_gPk3JKuEEw'

list_comand = ' /start, /stop - остановить бота, /help - список команд, /comp - комплименты девушке.'
compliment_girl($url)
compliment_girl($url2)
compliment_girl($url3)

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    when '/comp'
      bot.api.send_message(chat_id: message.chat.id, text: "#{$array_text_girl.sample}")
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: list_comand)
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Нет такой команды. Введите /help для прсомотра доступных команд")
    end
  end
end
