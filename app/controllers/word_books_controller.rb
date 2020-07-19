class WordBooksController < ApplicationController
  before_action :set_word_book, only: [:show, :edit, :update, :destroy]
  before_action :sign_in_required

  # GET /word_books
  # GET /word_books.json
  def index
    @word_books = WordBook.all
  end

  # GET /word_books/1
  # GET /word_books/1.json
  def show
  end

  # GET /word_books/new
  def new
    @word_book = WordBook.new
    @word_book.words.build
  end

  # GET /word_books/1/edit
  def edit
  end

  # POST /word_books
  # POST /word_books.json
  def create
    @word_book = current_user.word_books.build(word_book_params)
    if @word_book.save
      redirect_to @word_book, notice: t('.success')
    else
      flash.now[:alert] = t('.failed')
      render :new
    end
  end

  # PATCH/PUT /word_books/1
  # PATCH/PUT /word_books/1.json
  def update
    if @word_book.update(word_book_params)
      redirect_to @word_book, notice: t('.success')
    else
      flash.now[:alert] = t('.failed')
      render :edit
    end
  end

  # DELETE /word_books/1
  # DELETE /word_books/1.json
  def destroy
    @word_book.destroy
    respond_to do |format|
      format.html { redirect_to word_books_url, notice: 'Word book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_word_book
      @word_book = WordBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def word_book_params
      params.require(:word_book).permit(:title, :user_id, {words_attributes: [:id, :name, :translation, :_destroy]})
    end
end
