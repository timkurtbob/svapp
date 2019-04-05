class Entries::ArchivesController < ApplicationController
  def index
    @archived_entries = policy_scope([:archive, Entry.where(deactivated: true)])
  end

  def update
    @archiving_entry = Entry.find(params[:id])
    if @archiving_entry.deactivated == true
      @archiving_entry.deactivated = false
    else
      @archiving_entry.deactivated = true
    end
    authorize([:archive, @archiving_entry])
    if @archiving_entry.save

      redirect_to entries_path, notice: "Archiv wurde aktualisiert"
    else
      redirect_to entries_path, alert: "Archiv konnte nicht aktualisiert werden"
    end
  end
end
