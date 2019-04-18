class CommentsController < ApplicationController
  def create
    @entry = Entry.find(params[:id])
    authorize @entry
    @comment = Comment.new(comment_params)
    @comment.entry = @entry
    @comment.user = current_user
    if @comment.save
      respond_to do |format| authorize @entry
        format.html { redirect_to entry_path(@entry) }
        format.js # <-- will render `app/views/comments/create.js.erb`
      end
    else
      render 'new'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
