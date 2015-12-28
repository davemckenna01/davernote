class NotesController < ApplicationController
  helper_method :note
  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :set_tags

  def index
    @notes = Note.all
  end

  def create
    @note = Note.create(note_params)
    redirect_to note_url(@note)
  end

  def update
    @note.update(note_params)
    redirect_to note_url(@note)
  end

  # GET /notes/new
  def new
  end

  # GET /notes/1/edit
  def edit
  end  

  # helper used in _form based on create/edit existing
  def note
    if params[:id]
      Note.find_by_id params[:id]
    else
      Note.new
    end
  end

  def note_params
    params.require(:note).permit(:name, :content, { tag_ids:[] })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    def set_tags
      @tags = Tag.all
    end

end
