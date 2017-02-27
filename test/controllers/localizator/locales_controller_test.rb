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
      locales_file = Rails.root.join('config', 'locales', 'en.yml')

      assert_equal(YAML.load_file(locales_file)['en']['hello'], 'hello')
      post :update, translations: { "en.hello" => 'Hello', "uk.hello" => "Привіт", "ru.hello" => 'Привет' }
      assert_equal(YAML.load_file(locales_file)['en']['hello'], 'Hello')
      post :update, translations: { "en.hello" => 'hello', "uk.hello" => "привіт", "ru.hello" => 'привет' }
      assert_equal(YAML.load_file(locales_file)['en']['hello'], 'hello')

      assert_redirected_to locales_path
    end

    test "should get download" do
      get :download
      assert_response :success
    end

    test "should get reload" do
      File.delete(Rails.root.join('tmp', 'restart.txt'))
      get :reload
      assert_redirected_to locales_path
      assert_equal(File.exist?(Rails.root.join('tmp', 'restart.txt')), true)
    end
  end
end
