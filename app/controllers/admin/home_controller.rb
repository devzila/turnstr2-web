class Admin::HomeController < Admin::BaseController

  before_action :set_page_title

  def index

  end


  def set_page_title
    @page_title = "Dashboard"
  end

end