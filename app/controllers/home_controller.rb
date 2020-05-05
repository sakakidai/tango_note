class HomeController < ApplicationController
  before_action :sign_in_required, only: :index
  def index
  end
end
