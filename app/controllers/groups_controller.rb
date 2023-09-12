class GroupsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def destroy
    @group = Group.find(params[:id])
    @records = @group.records
    @records.destroy_all
    @group.destroy
    redirect_to groups_path, notice: 'Group deleted.'
  end

  def index
    @groups = Group.all.order(created_at: :desc).limit(100)
  end

  def new
    @group = Group.new
    @icons_url = [
      'icons/01.jpg', 'icons/02.jpg', 'icons/03.jpg', 'icons/04.jpg', 'icons/05.jpg',
      'icons/06.jpg', 'icons/07.jpg', 'icons/08.jpg', 'icons/09.jpg', 'icons/10.jpg',
      'icons/11.jpg', 'icons/12.jpg', 'icons/13.jpg', 'icons/14.jpg', 'icons/15.jpg',
      'icons/16.jpg', 'icons/17.jpg', 'icons/18.jpg', 'icons/19.jpg', 'icons/20.jpg',
      'icons/21.jpg', 'icons/22.jpg', 'icons/23.jpg', 'icons/24.jpg', 'icons/25.jpg'
    ]
  end

  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      flash[:notice] = 'Group created!'
      redirect_to groups_path
    else
      flash[:notice] = @group.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
