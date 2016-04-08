class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [ :destroy ]

  # GET /books
  # GET /books.json
  def index
    @page_title = 'Library'
    @books = Book.all

    sort_by_author_last_name

  end

  # GET /books/1
  # GET /books/1.json
  def show
    @notes = @book.notes;
    @notes.sort_by!{|n| n.page_num}
  end

  # GET /books/new
  def new
    @page_title = "New Book"
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
    @page_title = 'Edit ' + @book.title
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render action: 'show', status: :created, location: @book }
      else
        format.html { render action: 'new' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :author, :filename)
    end

    def sort_by_author_last_name
      @books.sort_by!{|b| b.last_name }
    end

end
