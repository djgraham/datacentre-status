class Admin::StatusesController < ApplicationController

  before_filter :load_status, :except => [:index, :new, :create]
  respond_to :html

  def index
    @statuses = Status.all
  end

  def edit

  end

  def new
    @status = Status.new
  end

  def update
    if @status.update_attributes(params[:status])
      redirect_to admin_statuses_path, :flash => { :info => "Status saved" }
    else
      render :action => :edit
    end
  end

  def create
    @status = Status.new
    if @status.update_attributes(params[:status])
      redirect_to admin_statuses_path, :flash => { :info => "Status created" }
    else
      render :action => :edit
    end
  end

  protected

  def load_status
    @status = Status.find params[:id] 
  end

end
