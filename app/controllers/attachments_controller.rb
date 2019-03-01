class AttachmentsController < ApplicationController
  def create
    @entry = Entry.find(params[:entry_id])
    authorize @entry
    @attachment = Attachment.new(attachment_params)
    authorize @attachment
    @user = current_user
    @attachment.user = @user
    @attachment.entry = @entry

    @attachment.save
  end

  def attachment_params
    params.require(:attachment).permit(:name)
  end
end
