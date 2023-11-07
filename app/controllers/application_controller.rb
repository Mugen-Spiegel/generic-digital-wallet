class ApplicationController < ActionController::Base
    before_action :user_signed_in?

    include Authentication
end
