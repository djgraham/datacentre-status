class StatusesController < ApplicationController

  respond_to :html

  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def edit
    @status = Status.find(params[:id])
    respond_with(@status)
  end

  def update
    @status = Status.find(params[:id])
    if @status.update_attributes!(params[:status])
      redirect_to statuses_path, :flash => { :info => "The status was successfully updated" }
    else
      render :action => :edit
    end
  end

  def create
    @status = Status.new(params[:status])
    if @status.save
      redirect_to statuses_path, :flash => { :info => "The status was successfully created" }
    else
      render :action => :new
    end
  end

end
