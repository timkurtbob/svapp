class EntriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show] # to be adjusted for production!!!

  def show
    @entry = Entry.find(params[:id])
    @author = @entry.user
    @comments = @entry.comments
  end
end
