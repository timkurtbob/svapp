class DocumentsController < ApplicationController
  after_action :verify_authorized, except: [:index, :create]
  def index
    @school_documents = documents_from_users_school
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

  def documents_from_users_school
    all_documents = scoped_document
    school_docs = all_documents.select { |d| d.school = current_user.school }
    return school_docs
  end

  def document_params
    params.require(:document).permit(:name, :school_id)
  end

  def scoped_document
    policy_scope(Document)
  end

end
