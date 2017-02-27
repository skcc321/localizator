require 'test_helper'

module Localizator
  class LocalesControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get show" do
      get :index
      assert_response :success
    end

    test "should post update" do
      post :update, translations: { "en.hello" => 'Hello', "uk.hello" => "Привіт", "ru.hello" => 'Привет' }
      assert_redirected_to locales_path
    end
  end
end
