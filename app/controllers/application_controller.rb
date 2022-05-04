class ApplicationController < ActionController::Base
  # Adcionado a linha abaixo devido falha de verificação no token após requisição POST
  protect_from_forgery unless: -> { request.format.json? }
end
