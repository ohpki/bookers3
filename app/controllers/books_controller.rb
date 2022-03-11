class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @book_comment = BookComment.new
  end


  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_comment = BookComment.new
    @book_comments = BookComment.where(book_id: @book.id)
    # @book_comments = @book.book_comments  #投稿詳細に関連付けてあるコメントを全取得
    # @comment = current_user.book_comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
    # @book_comment = BookComment.new

  end

  def edit
    @book = Book.find(params[:id])
    if @book.user = current_user
      render
    else
      redirect_to books_path
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end




end
