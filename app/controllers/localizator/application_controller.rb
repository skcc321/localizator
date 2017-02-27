module Localizator
  class ApplicationController < ActionController::Base
    if Localizator.username && Localizator.password
      http_basic_authenticate_with name: Localizator.username, password: Localizator.password
    end

    def app
      Localizator.app
    end
  end
end
