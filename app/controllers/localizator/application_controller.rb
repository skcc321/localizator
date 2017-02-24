module Localizator
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    http_basic_authenticate_with name: Localizator.username, password: Localizator.password

    def app
      Localizator.app
    end
  end
end
