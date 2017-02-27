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
  end
end
