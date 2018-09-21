class StaticController < ApplicationController

  layout false

  def show
    render template: "static/#{params[:page]}"
  end

end
