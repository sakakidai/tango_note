class WordBooksController < ApplicationController
  before_action :set_word_book, only: [:show, :edit, :update, :destroy]

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
  end

  # GET /word_books/1/edit
  def edit
  end

  # POST /word_books
  # POST /word_books.json
  def create
    @word_book = WordBook.new(word_book_params)

    respond_to do |format|
      if @word_book.save
        format.html { redirect_to @word_book, notice: 'Word book was successfully created.' }
        format.json { render :show, status: :created, location: @word_book }
      else
        format.html { render :new }
        format.json { render json: @word_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /word_books/1
  # PATCH/PUT /word_books/1.json
  def update
    respond_to do |format|
      if @word_book.update(word_book_params)
        format.html { redirect_to @word_book, notice: 'Word book was successfully updated.' }
        format.json { render :show, status: :ok, location: @word_book }
      else
        format.html { render :edit }
        format.json { render json: @word_book.errors, status: :unprocessable_entity }
      end
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
      params.require(:word_book).permit(:title, :user_id)
    end
end
