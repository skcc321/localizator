module Localizator
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    if Localizator.username && Localizator.password
      http_basic_authenticate_with name: Localizator.username, password: Localizator.password
    end

    def app
      Localizator.app
    end
  end
end
