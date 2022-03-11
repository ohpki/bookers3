class BookCommentsController < ApplicationController
  def new
    @book_comment = BookComment.new
  end
  def create
    # @book_comment = current_user.book_comments.new(comment_params)
    #   @book_comment.save
    #   redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.new(user_id: current_user.id, book_id: params[:book_id], comment: book_comment_params)
    @book_comment.save
    @book_comments = BookComment.where(book_id: @book.id)

  end
  def destroy
    @book = Book.find(params[:book_id])
    @book_comment = BookComment.find(params[:id])
    @book_comment.destroy
    @book_comments = BookComment.where(book_id: @book.id)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)

  end

end
