class RecordsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to group_records_path(params[:group_id]), notice: 'Record deleted.'
  end

  def index
    @group = Group.find(params[:group_id])
    @records = @group.records.order(created_at: :desc).limit(100)
  end

  def new
    @record = Record.new
    @group = Group.find(params[:group_id])
    @groups = Group.where(user_id: current_user)
  end

  def create
    if record_groups_id.nil?
      flash[:notice] = 'Select a group'
      redirect_to request.referrer
    else
      record_groups_id.each do |group_id|
        @record = Record.new(record_params)
        @record.user = current_user
        @record.group = Group.find(group_id)
        flash[:notice] = 'Record created!'
        unless @record.save
          flash[:notice] = @record.errors.full_messages.join(', ')
          return redirect_to request.referrer
        end
      end
      redirect_to group_records_path(params[:group_id])
    end
  end

  private

  def record_params
    params.require(:record).permit(:name, :amount)
  end

  def record_groups_id
    params.require(:record)['group']
  end
end
