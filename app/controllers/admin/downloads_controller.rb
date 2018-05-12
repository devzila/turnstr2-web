class Admin::DownloadsController < Admin::BaseController
  before_action :set_page_title


  def show

  end


  def set_page_title
    @page_title = "Download"
  end


end