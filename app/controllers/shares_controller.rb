class SharesController < ApplicationController
  before_action :set_share, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /shares
  # GET /shares.json
  def index
    @shares = current_user.incoming_shares
    @page_title = "Book Shares"
  end

  # GET /shares/1
  # GET /shares/1.json
  def show
  end

  # GET /shares/new
  def new
    @share = Share.new
    @users = User.all
    @users.map!{|usr| [usr.codename, usr.id]}
    @books = Book.all
    @books.map!{|book| [book.title, book.id]}
  end

  # GET /shares/1/edit
  def edit
    @users = User.all
    @users.map!{|usr| [usr.codename, usr.id]}
    @books = Book.all
    @books.map!{|book| [book.title, book.id]}
  end

  # POST /shares
  # POST /shares.json
  def create
    @share = Share.new(share_params)

    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: 'Share was successfully created.' }
        format.json { render action: 'show', status: :created, location: @share }
      else
        format.html { render action: 'new' }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shares/1
  # PATCH/PUT /shares/1.json
  def update
    respond_to do |format|
      if @share.update(share_params)
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share.destroy
    respond_to do |format|
      format.html { redirect_to shares_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share
      @share = Share.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_params
      params.require(:share).permit(:from_user_id, :to_user_id, :book_id, :message)
    end
end
