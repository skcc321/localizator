require 'test_helper'

module Localizator
  class LocalesControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "should get show" do
      get :show
      assert_response :success
    end

    test "should get update" do
      get :update
      assert_response :success
    end

  end
end
