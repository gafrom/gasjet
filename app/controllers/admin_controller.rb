class AdminController < ApplicationController
  before_action :authenticate_user!, :authorize

  private

  def authorize
    render('errors/forbidden', layout: false, status: 403) unless current_user.chief?
  end
end
