class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        @users = User.all
        render json: @users, only: [:name], status: :ok
      end
      format.html
    end
  end
end
