class CookBooksController < ApplicationController
  before_action :set_cook_book, only: [:show, :edit, :update, :destroy]

  # GET /cook_books
  # GET /cook_books.json
  def index
    @cook_books = CookBook.all
  end

  # GET /cook_books/1
  # GET /cook_books/1.json
  def show
  end

  # GET /cook_books/new
  def new
    @cook_book = CookBook.new
  end

  # GET /cook_books/1/edit
  def edit
  end

  # POST /cook_books
  # POST /cook_books.json
  def create
    @cook_book = CookBook.new(cook_book_params)

    respond_to do |format|
      if @cook_book.save
        format.html { redirect_to @cook_book, notice: 'Cook book was successfully created.' }
        format.json { render :show, status: :created, location: @cook_book }
      else
        format.html { render :new }
        format.json { render json: @cook_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cook_books/1
  # PATCH/PUT /cook_books/1.json
  def update
    respond_to do |format|
      if @cook_book.update(cook_book_params)
        format.html { redirect_to @cook_book, notice: 'Cook book was successfully updated.' }
        format.json { render :show, status: :ok, location: @cook_book }
      else
        format.html { render :edit }
        format.json { render json: @cook_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cook_books/1
  # DELETE /cook_books/1.json
  def destroy
    @cook_book.destroy
    respond_to do |format|
      format.html { redirect_to cook_books_url, notice: 'Cook book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cook_book
      @cook_book = CookBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cook_book_params
      params.require(:cook_book).permit(:name, :description, :user_id)
    end
end
