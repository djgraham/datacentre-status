class Admin::StatusesController < ApplicationController

  respond_to :html

  def index
    @statuses = Status.all
  end

  def edit
    @status = Status.find(params[:id])
  end

end
