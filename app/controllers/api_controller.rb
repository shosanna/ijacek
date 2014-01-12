  class ApiController < ActionController::Base
    http_basic_authenticate_with name: "nuf", password: "muf"
  end
