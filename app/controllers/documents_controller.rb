class DocumentsController < ApplicationController
  after_action :verify_authorized, except: [:index, :create]
  def index
    @documents = scoped_document
    @school = current_user.school
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    authorize @document
    @school = current_user.school
    @document.school = @school
    @document.save
  end

  private

  def document_params
    params.require(:document).permit(:name, :school_id)
  end

  def scoped_document
    policy_scope(Document)
  end
end
