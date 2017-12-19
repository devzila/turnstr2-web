class Admin::BaseController < ApplicationController
  layout 'admin'
  before_filter :authorize


  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin

  def authorize
    redirect_to new_admin_sessions_path unless current_admin
  end



end