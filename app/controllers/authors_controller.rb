class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    render "/authors/show"
  end

  def new
    @author = Author.new
    render "/authors/new"
  end

  def create
    @author = Author.new(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render new_author_path(@author)
    end
  end

  def edit
    @author = Author.find(params[:id])
    render "/authors/edit"
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render "/authors/edit"
    end
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
