class EntriesController < ApplicationController
  after_action :verify_authorized, except: :index


  def index
    case params[:query]
    when "Neuigkeiten"
     @entries = scoped_entry.order(created_at: :DESC)
    when "Nächste"
      @entries = scoped_entry.where("date >= ?", DateTime.now)
    when "Letzte"
      @entries = scoped_entry.where("date <= ?", DateTime.now)
    else
      @entries = scoped_entry
    end
    @entry = Entry.new
  end

  def show
    @entry = Entry.find(params[:id])
    authorize @entry
    @author = @entry.user
    @comments = @entry.comments.reverse
    @comment = Comment.new
  end

  def create
    @entry = Entry.new(entry_params)
    authorize @entry
    @entry.user = current_user
    @entry.save
    redirect_to @entry
  end

  def update
    @entry = Entry.find(params[:id])
    authorize @entry
    @entry.update(entry_params)
    redirect_to @entry
  end

  def bookmark
    @entry = Entry.find(params[:id])
    authorize @entry
    @bookmark = current_user.bookmarks.find_by(entry_id: @entry.id)
    if @bookmark
      @bookmark.destroy
    else
      Bookmark.create(entry: @entry, user: current_user)
    end
    respond_to do |format|
      format.html { redirect_to entries_path }
      format.js # <-- will render `app/views/entries/bookmark.js.erb`
    end
  end

  def my_bookmarks
    @my_bookmarks = current_user.bookmarks
  end

  def bee
    @comment = Comment.find(params[:id])
    @entry = @comment.entry
    authorize @entry
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
    authorize @entry
    @comment = Comment.new(comment_params)
    @comment.entry = @entry
    @comment.user = current_user
    # authorize @comment
    if @comment.save
      respond_to do |format|    authorize @entry

        format.html { redirect_to entry_path(@entry) }
        format.js # <-- will render `app/views/entries/add_comment.js.erb`
      end
    else
      render 'new'
    end
  end

  private

  def scoped_entry
    policy_scope(Entry)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def entry_params
    params.require(:entry).permit(:title, :description, :time, :date, :location)
  end
end
