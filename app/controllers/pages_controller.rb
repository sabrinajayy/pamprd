class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home

    @artists = Artist.all

    if user_signed_in?
      @page_user = current_user
    end

  end

end
