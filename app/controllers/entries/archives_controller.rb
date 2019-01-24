class Entries::ArchivesController < ApplicationController

  def index
    @archived_entries = policy_scope([:archive, Entry.where(deactivated: true)])
    if !@archived_entries
      @archived_entries = []
    end
  end

  def update
    @archiving_entry = Entry.find(params[:id])
    @archiving_entry.deactivated = true
    authorize([:archive, @archiving_entry])
    if @archiving_entry.save
      redirect_to entries_path, notice: "#{@archiving_entry.title} has been archived"
    else
      redirect_to entries_path, alert: "#{@archiving_entry.title} could not be archived"
    end
  end
end
