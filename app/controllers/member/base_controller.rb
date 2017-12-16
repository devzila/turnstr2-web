class Member::BaseController < ApplicationController
  layout 'application'
  before_filter :authorize


  def current_member
    @current_member ||= Admin.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member

  def authorize
    redirect_to new_member_session_path unless current_member
  end
end