class EntriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show] # to be adjusted for production!!!

  def index
    @entries = Entry.all
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
    @author = @entry.user
    @comments = @entry.comments.reverse
    @comment = Comment.new
  end

  def create
    @entry = Entry.new(entry_params)
    @entry.user = current_user
    @entry.save
    redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])
    @entry.update(entry_params)
    redirect_to @entry
  end

  def bee
    @comment = Comment.find(params[:id])
    @entry = @comment.entry
    @bee = current_user.bees.find_by(comment_id: @comment.id)
    if @bee
      @bee.destroy
    else
      Bee.create(comment_id: @comment.id, user_id: current_user.id)
    end
    respond_to do |format|
      format.html { redirect_to entry_path(@entry) }
      format.js # <-- will render `app/views/entries/bee.js.erb`
    end
  end

  def add_comment
    @entry = Entry.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.entry = @entry
    @comment.user = current_user
    # authorize @comment
    if @comment.save
      respond_to do |format|
        format.html { redirect_to entry_path(@entry) }
        format.js # <-- will render `app/views/entries/add_comment.js.erb`
      end
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :time, :date, :location)
  end
end
