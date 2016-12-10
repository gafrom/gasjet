class WelcomeController < ApplicationController
  def home
    @categories = Category.all
  end

  def contacts
  end
end
