class NoAuthController < ApplicationController
  protect_from_forgery with: :exception
  skip_before_action :authenticate_person!
end
