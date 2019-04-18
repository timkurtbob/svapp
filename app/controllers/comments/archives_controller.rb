class Comments::ArchivesController < ApplicationController
  def index
    @archived_comments = policy_scope([:archive, Comment.where(deactivated: true)])
  end

  def update
    @archiving_comment = Comment.find(params[:id])
    if @archiving_comment.deactivated == true
      @archiving_comment.deactivated = false
    else
      @archiving_comment.deactivated = true
    end
    authorize([:archive, @archiving_comment])
    if @archiving_comment.save
      redirect_to entry_path(@archiving_comment.entry), notice: "Archiv wurde aktualisiert"
    else
      redirect_to entry_path(@archiving_comment.entry), alert: "Archiv konnte nicht aktualisiert werden"
    end
  end
end
