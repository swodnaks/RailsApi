# README

1. В этом API приложении стандартные модели user, post, с ассоциациями, валидациями и контроллеры к ним

2. Данные у моделей в seeds.rb созданы с помощью гема faker

3. Все данные в контроллерах должны отвечать в формате JSON с помощью гемов jbuilder

или active_model_serializers

4. Если использовать jbuilder, то надо создать во views представление в формате .json.jbuilder
Если использовать сериалайзеры, то нужно их создать и указать какие поля будут возвращены в формате JSON.

5. У юзеров есть уникальный токен, который появляется при его создании(регистрации) before_create -> {self.token = generate_token} и проверяется с помощью приватного метода в контроллере

6. С помощью api_client.rb и гема Faraday можно делать HTTP запросы и проверить как
все работает(регистрация юзеров, удаление и создание постов)

Например этот скрипт создает пост с помощью токена определенного юзера:

client = Faraday.new(url: 'http://localhost:3000') do |config|
  config.adapter  Faraday.default_adapter
  config.token_auth('d8f824cbc7e02f7536def762e4c02ef0')
end

response = client.post do |r|
  r.url '/api/v1/posts'
  r.headers['Content-Type'] = 'application/json'
  r.body = '{ "post": {"title": "Hello!", "body": "How are you?"} }'
end
