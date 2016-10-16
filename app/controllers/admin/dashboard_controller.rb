class Admin::DashboardController < AdminController
  def index
    @current_user = current_user
  end
end
