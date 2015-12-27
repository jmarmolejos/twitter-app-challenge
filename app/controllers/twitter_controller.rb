class TwitterController < ApplicationController
  include TwitterHelper

  def index
  end

  def timeline
    user = params['user']
    @tweets = get_timeline user
  end
end
