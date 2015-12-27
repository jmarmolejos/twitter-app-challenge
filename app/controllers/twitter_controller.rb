class TwitterController < ApplicationController
  include TwitterHelper

  before_action :require_login

  def index
  end

  def timeline
    user = params['user']
    @tweets = get_timeline user
    @user_handle = "@#{user}"
  end

  private

    def require_login
      unless logged_in?
        redirect_to login_url
      end
    end
end
