class Admin::EventsController < ApplicationController

  before_filter :load_event, :except => [:index, :new, :create]
  respond_to :html

  def index
    @events = Event.all
  end

  def edit

  end

  def show

  end

  def new
    @event = Event.new
  end

  def update
    if @event.update_attributes(params[:event])
      redirect_to admin_events_path, :flash => { :info => "Event saved" }
    else
      render :action => :edit
    end
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      redirect_to admin_events_path, :flash => { :info => "Event created" }
    else
      render :action => :edit
    end
  end

  def destroy
    @event.destroy
      redirect_to admin_events_path, :flash => { :info => "Event deleted" }
  end

  protected

  def load_event
    @event = Event.find params[:id] 
  end

end
