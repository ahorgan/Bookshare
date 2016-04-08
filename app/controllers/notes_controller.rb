class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @book = Book.find params[:book_id]
    @notes = @book.notes
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @book = @note.book
  end

  # GET /notes/new
  def new
    @book = Book.find params[:book_id]
    @note = @book.notes.new
  end
 
  # GET /notes/1/new_reply
  def new_reply
    @parent_note = Note.find params[:note_id]
    @note = @parent_note.child_notes.new
  end

  # GET /notes/1/edit
  def edit
    @book = Book.find params[:book_id]
    @note = @book.notes.new
  end

  # POST /notes
  # POST /notes.json
  def create
    @book = Book.find params[:book_id]
    @note = @book.notes.new

    respond_to do |format|
      if @note.save
        format.html { redirect_to bookc_path(@book), notice: 'Note was successfully created.' }
        format.json { render action: 'show', status: :created, location: @note }
      else
        format.html { render action: 'new' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:user_id, :book_id, :topic, :content, :parent_note_id, :page_num)
    end
end
