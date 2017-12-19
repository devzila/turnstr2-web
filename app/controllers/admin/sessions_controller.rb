class Admin::SessionsController < Admin::BaseController

  skip_before_filter :authorize


  def new

  end

  def create
    user = Admin.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:admin_id] = user.id
      redirect_to '/admin/home'
    else
      flash[:error] = 'Invalid login password'
      redirect_to new_admin_sessions_path
    end

  end

  def destroy
    session[:admin_id] = nil
    redirect_to new_admin_sessions_path
  end

end