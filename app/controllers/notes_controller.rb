class NotesController < ApplicationController
  helper_method :note
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end


  def create
    @note = Note.create(note_params)
    redirect_to note_url(@note)
  end

  def update
    @note.update(note_params)
    puts params[:note][:tags].class
    # tags = Tag.find(params[:note][:tags])
    # puts "TAGS>>>>>>>>", tags
    # @note.tags << tags
    redirect_to note_url(@note)
  end

  # GET /notes/new
  def new
    @tags = Tag.all
  end

  # GET /notes/1/edit
  def edit
    @tags = Tag.all
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
    params.require(:note).permit(:name, :content)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

end
