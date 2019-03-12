class AttachmentsController < ApplicationController
  after_action :verify_authorized, except: [:create]
  def create
    @entry = Entry.find(params[:entry_id])
    authorize @entry
    @attachment = Attachment.new(attachment_params)
    authorize @attachment
    @user = current_user
    @attachment.user = @user
    @attachment.entry = @entry
    @attachment.file_name = Time.now.to_s[0..-6]
    @attachments = attachments_from_same_entry

    if @attachment.save
      respond_to do |format|
        format.html { redirect_to @entry }
        format.js
      end
    end
  end

  private

  def attachment_params
    params.require(:attachment).permit(:name, :file_type)
  end

  def attachments_from_same_entry
    all_attachments = Attachment.all
    a = []
    all_attachments.select { |aa| aa.entry == @entry}.each do |x|
      a << x
    end
    return a
  end
end
