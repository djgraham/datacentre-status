class Admin::CommentsController < ApplicationController

  before_filter :load_event#, :except => [:index, :new, :create]
  before_filter :load_comment, :except => [:index, :new, :create]
  respond_to :html

  def index
    @comments = @event.comments
    @comment = @comments.new
  end

  def edit

  end

  def show

  end

  def new
    @comment = @event.comments.new
  end

  def update
    if @comment.update_attributes(params[:comment])
      redirect_to admin_event_comments_path(@event), :flash => { :info => "Comment saved" }
    else
      render :action => :edit
    end
  end

  def create
    @comment = @event.comments.new(params[:comment])
    if @comment.save
      redirect_to admin_event_comments_path(@event), :flash => { :info => "Comment created" }
    else
      render :action => :edit
    end
  end

  def destroy
    @comment.destroy
      redirect_to admin_event_comments_path(@event), :flash => { :info => "Comment deleted" }
  end


  protected
  def load_event
    @event = Event.find params[:event_id]
  end

  def load_comment
    @comment = @event.comments.find params[:id]
  end

end
